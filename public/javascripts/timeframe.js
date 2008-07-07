Date.weekdays = $w('Sunday Monday Tuesday Wednesday Thursday Friday Saturday');
Date.months   = $w('January February March April May June July August September October November December');

var Timeframes = [];

var Timeframe = Class.create({
 /**
  * Syntax:
  * 
  * new Timeframe('el_id', {
  *   months: 2,
  *   weekoffset: 0
  * });
  */
  Version: '0.1 Calamari',
  
  initialize: function(element, options) {
    Timeframes.push(this);
    
    this.container = $(element);
    
    this.options = $H({
      months:     2,
      format:     '%b %d, %Y',
      weekoffset: 0
    }).merge(options || {});
    
    this.months = this.options.get('months');
    this.calendars = [];
    
    // Look for custom buttons:
    this.buttons = $H({
      previous: $(this.options.get('previousbutton')),
      today:    $(this.options.get('todaybutton')),
      next:     $(this.options.get('nextbutton')),
      reset:    $(this.options.get('resetbutton'))
    });
    // Or use these default labels:
    this.buttonLabels = $H({
      previous: '&larr;',
      today:    'T',
      next:     '&rarr;',
      reset:    'R'
    });
    
    // Look for custom fields:
    this.fields = $H({
      start:    $(this.options.get('startfield')),
      end:      $(this.options.get('endfield'))
    });
    
    this.earliest     = this.parse(this.options.get('earliest'));
    this.latest       = this.parse(this.options.get('latest'));    
    this.format       = this.options.get('format');
    this.weekoffset   = this.options.get('weekoffset');
    this.weekdayNames = Date.weekdays; // this.weekdayNames = Date.internationalizations.get(this.options.get('locale'));
    this.monthNames   = Date.months;   // this.monthNames   = Date.internationalizations.get(this.options.get('locale'));
    this.date         = new Date();
    this.defaultDate  = new Date(this.date)
    
    this.disableSelection();
    this.buildButtons();
    this.months.times(function(month) { this.buildCalendar(month) }.bind(this));
    this.buildFields();
    this.populate();
    this.activate();
  },
  
  parse: function(string) {
    var date = new Date(Date.parse(string));
    return (date == 'Invalid Date' || date == 'NaN') ? null : date.neutral();
  },
  
  // Make sure dragging doesn't select any calendar text
  disableSelection: function() {
    this.container.onselectstart       = function() { return false; };
    this.container.unselectable        = 'on';
    this.container.style.MozUserSelect = 'none';
    this.container.style.cursor        = 'default';
  },
  
  buildButtons: function() {
    var list = new Element('ul', { id: 'timeframe_menu' });
    this.buttons.each(function(pair) {
      if(pair.value)
        pair.value.addClassName('timeframe_button').addClassName(pair.key);
      else {
        var item = new Element('li');
        var button = new Element('a', { className: 'timeframe_button ' + pair.key, href: '#', onclick: 'return false;' }).update(this.buttonLabels.get(pair.key));
        button.onclick = function() { return false; };
        this.buttons.set(pair.key, button);
        item.insert(this.buttons.get(pair.key));
        list.insert(item);
      }
    }.bind(this))
    if(list.childNodes.length > 0) this.container.insert(list);
    
    this.clearButton = new Element('span', { className: 'clear' }).update(new Element('span').update('X'));
  },
  
  buildCalendar: function(calendarNumber) {
    var calendar = new Element('table', { id: 'calendar_' + calendarNumber, border: 0, cellspacing: 0, cellpadding: 5 });
    calendar.insert(new Element('caption'));
    calendar.insert(this.buildHead());
    calendar.insert(this.buildBody());
    this.container.insert(calendar);
    this.container.insert(new Element('br')); /* Adicionado para exibir um calendario abaixo do outro */
    this.calendars.push(calendar);
  },
  
  buildHead: function() {
    var head = new Element('thead');
    var row  = new Element('tr');
    this.weekdayNames.length.times(function(column) {
      var weekday = this.weekdayNames[(column + this.weekoffset) % 7];
      var cell = new Element('th', { scope: 'col', abbr: weekday }).update(weekday.substring(0,1));
      row.insert(cell);
    }.bind(this));
    head.insert(row);
    return head;
  },
  
  buildBody: function() {
    var body = new Element('tbody');
    (6).times(function(rowNumber) {
      var row = new Element('tr');
      this.weekdayNames.length.times(function(column) {
        var cell = new Element('td');
        row.insert(cell);
      });
      body.insert(row);
    }.bind(this));
    return body;
  },
  
  buildFields: function() {
    var fieldset = new Element('div', { id: 'timeframe_fields' });
    this.fields.each(function(pair) {
      if(pair.value)
        pair.value.addClassName('timeframe_field').addClassName(pair.key);
      else {
        var container = new Element('div', { id: pair.key + 'field_container' });
        this.fields.set(pair.key, new Element('input', { id: pair.key + 'field', name: pair.key + 'field', type: 'text', value: '' }));
        container.insert(new Element('label', { 'for': pair.key + 'field' }).update(pair.key));
        container.insert(this.fields.get(pair.key));
        fieldset.insert(container);
      }
    }.bind(this));
    if(fieldset.childNodes.length > 0) this.container.insert(fieldset);
    this.startfield = this.fields.get('start');
    this.endfield = this.fields.get('end');
    this.parseStartField();
    this.parseEndField();
  },
  
  populate: function() {
    var month = this.date.neutral();
    month.setDate(1);
    this.months.times(function(n) {      
      var calendar = $('calendar_' + n);
      var caption = calendar.select('caption').first();
      caption.update(this.monthNames[month.getMonth()] + ' ' + month.getFullYear());
      
      var iterator = new Date(month);
      var offset = (iterator.getDay() - this.weekoffset) % 7;
      var inactive = offset > 0 ? 'pre beyond' : false;
      iterator.setDate(iterator.getDate() - offset);
      if(iterator.getDate() > 1 && !inactive) {
        iterator.setDate(iterator.getDate() - 7);
        if(iterator.getDate() > 1) inactive = 'pre beyond';
      }
      
      calendar.select('td').each(function(day) {
        day.date = new Date(iterator); // Is this expensive (we unload these later)? We could store the epoch time instead.
        day.update(day.date.getDate()).writeAttribute('class', inactive || 'active');
        if((this.earliest && day.date < this.earliest) || (this.latest && day.date > this.latest))
          day.addClassName('unselectable');
        else
          day.addClassName('selectable');
        if(iterator.toString() === new Date().neutral().toString()) day.addClassName('today');
        day.baseClass = day.readAttribute('class');
        
        iterator.setDate(iterator.getDate() + 1);
        if(iterator.getDate() == 1) inactive = inactive ? false : 'post beyond';
      }.bind(this));
      
      if(this.earliest && n == 0) {
        if(month.getMonth() == this.earliest.getMonth() && month.getFullYear() == this.earliest.getFullYear())
          this.buttons.get('previous').addClassName('disabled');
        else
          this.buttons.get('previous').removeClassName('disabled');
      }  
      if(this.latest && n == (this.calendars.length - 1)) {
        if(month.getMonth() == this.latest.getMonth() && month.getFullYear == this.latest.getFullYear())
          this.buttons.get('next').addClassName('disabled');
        else
          this.buttons.get('next').removeClassName('disabled');
      }        
      
      month.setMonth(month.getMonth() + 1);
    }.bind(this));
    this.refreshRange();
  },
  
  activate: function() {
    document.observe('click', this.handleClick.bind(this));
    document.observe('mousedown', this.handleMousedown.bind(this));
    document.observe('mouseover', this.handleMouseover.bind(this));
    document.observe('mouseup', this.setPoint.bind(this));
    document.observe('unload', this.deactivate.bind(this));
    if(Prototype.Browser.Opera) document.observe('mousemove', this.handleMousemove.bind(this));
    this.aimFieldObservers();
  },
  
  aimFieldObservers: function(field, assignment) {    
    [this.startfield, this.endfield].invoke('observe', 'focus', this.declareFocus.bind(this));
    [this.startfield, this.endfield].invoke('observe', 'blur', this.declareBlur.bind(this));
    new Form.Element.Observer(this.startfield, 0.2, function(element, value) {
      if(element.hasFocus) {
        this.parseStartField(value);
      }
    }.bind(this));
    new Form.Element.Observer(this.endfield, 0.2, function(element, value) {
      if(element.hasFocus) {
        this.parseEndField(value);
      }
    }.bind(this));
  },
  
  parseStartField: function() {
    var date = new Date(Date.parse(this.startfield.value));
    this.startdate = (date == 'Invalid Date' || date == 'NaN') ? null : (this.enddate && date > this.enddate) ? null : (this.earliest && date < this.earliest) ? null : date.neutral();
    if(this.startdate) {
      this.date = new Date(this.startdate);
      this.populate();
    }
    else this.refreshRange();
  },
  
  parseEndField: function() {
    var date = new Date(Date.parse(this.endfield.value));
    this.enddate = (date == 'Invalid Date' || date == 'NaN') ? null : (this.startdate && date < this.startdate) ? null : (this.latest && date >= this.latest) ? null : date.neutral();
    if(this.enddate) {
      this.date = new Date(this.enddate)
      if(this.startdate && this.enddate.getMonth() != this.startdate.getMonth() && this.enddate.getFullYear() != this.startdate.getFullYear())
        this.date.setMonth(this.date.getMonth() - (this.calendars - 1));
      this.populate();
    }
    else this.refreshRange();
  },
  
  declareFocus: function(event) {
    event.element().hasFocus = true;
    if(this.startdate && event.element() == this.startfield) {
      this.date = new Date(this.startdate);
      this.populate();
    }
    else if(this.enddate && event.element() == this.endfield) {
      this.date = new Date(this.enddate);
      if(this.startdate && this.enddate.getMonth() != this.startdate.getMonth() && this.enddate.getFullYear() != this.startdate.getFullYear())
        this.date.setMonth(this.date.getMonth() - (this.calendars - 1));
      this.populate();
    }
  },
  
  declareBlur: function(event) {
    var el = event.element();
    el.hasFocus = false;
    this.refreshFields(el);
  },
  
  deactivate: function() {
    this.container.select('td').each(function(day) {
      day.baseClass = null;
      day.date = null;
    });
  },
  
  handleClick: function(event) {
    if(!event.element().ancestors) return;
    var el;
    if(el = event.findElement('a.timeframe_button')) {
      if(el.hasClassName('disabled')) return;
      this.handleButtonClick(event, el);
    }
  },
  
  handleMousedown: function(event) {
    if(!event.element().ancestors) return;
    var el, em;
    if(el = event.findElement('span.clear')) {
      el.down('span').addClassName('active');
      if(em = event.findElement('td.selectable'))
        this.handleDateClick(em, true);
    }
    else if(el = event.findElement('td.selectable'))
      this.handleDateClick(el);
    else return;
  },
  
  handleButtonClick: function(event, element) {
    var el;
    var movement = this.calendars > 1 ? this.calendars - 1 : 1;
    if(element.hasClassName('next'))
      this.date.setMonth(this.date.getMonth() + movement);
    else if(element.hasClassName('previous'))
      this.date.setMonth(this.date.getMonth() - movement);
    else if(element.hasClassName('today'))
      this.date = new Date();
    else if(element.hasClassName('reset')) {
      this.resetFields();
    }
    this.populate();
  },
  
  resetFields: function() {
    this.startfield.value = this.startfield.defaultValue || '';
    this.endfield.value = this.endfield.defaultValue || '';
    this.date = new Date(this.defaultDate);
    var startdate = new Date(Date.parse(this.startfield.value)).neutral();
    this.startdate = (startdate == 'Invalid Date' || startdate == 'NaN') ? null : startdate;
    var enddate = new Date(Date.parse(this.endfield)).neutral();
    this.enddate = (enddate == 'Invalid Date' || enddate == 'NaN') ? null : enddate;
  },
  
  handleDateClick: function(element, couldClear) {
    this.mousedown = this.dragging = true;
    if(this.stuck)
      this.stuck = false;
    else if(couldClear) {
      if(!element.hasClassName('startrange')) return;
    }
    else {
      this.stuck = true;
      setTimeout(function() { if(this.mousedown) this.stuck = false; }.bind(this), 200);
    }
    this.getPoint(element.date);
  },
  
  getPoint: function(date) {
    if(this.startdate && this.startdate.toString() == date && this.enddate)
      this.startdrag = this.enddate;
    else {
      this.clearButton.hide();
      if(this.enddate && this.enddate.toString() == date)
        this.startdrag = this.startdate;
      else
        this.startdrag = this.startdate = this.enddate = date;
    }
    this.refreshRange();
  },
  
  handleMouseover: function(event) {
    var el;
    if(!this.dragging)
      this.toggleClearButton(event);
    else if(event.findElement('span.clear span.active'));
    else if(el = event.findElement('td.selectable'))
      this.extendRange(el.date);
    else this.toggleClearButton(event);
  },
  
  toggleClearButton: function(event) {
    var el;
    if(event.element().ancestors && event.findElement('td.selected')) {
      if(el = this.container.select('#calendar_0 .pre.selected').first());
      else if(el = this.container.select('.active.selected').first());
      if(el) Element.insert(el, { top: this.clearButton });
      this.clearButton.show().down('span').removeClassName('active');        
    }
    else {
      this.clearButton.hide();
    }
  },
  
  extendRange: function(date) {
    this.clearButton.hide();
    if(date > this.startdrag) {
      this.startdate = this.startdrag;
      this.enddate = date;
    }
    else if(date < this.startdrag) {
      this.startdate = date;
      this.enddate = this.startdrag;
    }
    else {
      this.startdate = this.enddate = date;
    }
    this.refreshRange();
  },
  
  setPoint: function(event) {
    if(!this.dragging) return;
    if(!this.stuck) {
      var el;
      this.dragging = false;
      if(el = event.findElement('span.clear span.active')) {
        el.removeClassName('active').up('span').hide();
        this.startdate = this.enddate = null;
        this.refreshFields();
      }
    }
    this.mousedown = false;
    this.refreshRange();
  },
  
  refreshRange: function() {
    this.container.select('td').each(function(day) {
      day.writeAttribute('class', day.baseClass);
      if(this.startdate <= day.date && day.date <= this.enddate) {
        var baseClass = day.hasClassName('beyond') ? 'beyond_' : day.hasClassName('today') ? 'today_' : null;
        var state = this.stuck || this.mousedown ? 'stuck' : 'selected';
        if(baseClass) day.addClassName(baseClass + state);
        day.addClassName(state);
        var rangeClass = '';
        if(this.startdate.toString() == day.date) rangeClass += 'start';
        if(this.enddate.toString() == day.date) rangeClass += 'end';
        if(rangeClass.length > 0) day.addClassName(rangeClass + 'range');
      }
      // Trick Opera into refreshing the selection (FIXME)
      if(Prototype.Browser.Opera) {
        day.unselectable = 'on';
        day.unselectable = null;
      }
    }.bind(this));
    if(this.dragging) this.refreshFields();
  },
  
  refreshFields: function(field) {
    var attempt;
    if(field) attempt = field.value;
    this.startfield.value = this.startdate ? this.startdate.strftime(this.format) : '';
    this.endfield.value = this.enddate ? this.enddate.strftime(this.format) : '';
    this.startfield.removeClassName('error');
    this.endfield.removeClassName('error');
    if(field && field.value == '' && attempt != '') field.addClassName('error');
  },
  
  handleMousemove: function(event) {
    if(event.findElement('#' + this.container.id + ' td')) window.getSelection().removeAllRanges();
  }
});

Object.extend(Date.prototype, {
  // modified from http://alternateidea.com/blog/articles/2008/2/8/a-strftime-for-prototype
  strftime: function(format) {
    var day = this.getDay(), month = this.getMonth();
    var hours = this.getHours(), minutes = this.getMinutes();
    function pad(num) { return num.toPaddedString(2); };
 
    return format.gsub(/\%([aAbBcdHImMpSwyY])/, function(part) {
      switch(part[1]) {
        case 'a': return Date.weekdays.invoke('substring', 0, 3)[day]; break;
        case 'A': return Date.weekdays[day]; break;
        case 'b': return Date.months.invoke('substring', 0, 3)[month]; break;
        case 'B': return Date.months[month]; break;
        case 'c': return this.toString(); break;
        case 'd': return pad(this.getDate()); break;
        case 'H': return pad(hours); break;
        case 'I': return (hours % 12 == 0) ? 12 : pad(hours % 12); break;
        case 'm': return pad(month + 1); break;
        case 'M': return pad(minutes); break;
        case 'p': return hours >= 12 ? 'PM' : 'AM'; break;
        case 'S': return pad(this.getSeconds()); break;
        case 'w': return day; break;
        case 'y': return pad(this.getFullYear() % 100); break;
        case 'Y': return this.getFullYear().toString(); break;
      }
    }.bind(this));
  },
  
  neutral: function() {
    var neutered = new Date(this);
    neutered.setHours(12);
    neutered.setMinutes(0);
    neutered.setSeconds(0);
    neutered.setMilliseconds(0);
    return neutered;
  }
});