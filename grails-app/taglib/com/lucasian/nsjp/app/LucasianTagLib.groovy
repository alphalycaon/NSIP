package com.lucasian.nsjp.app

import org.springframework.web.servlet.support.RequestContextUtils as RCU
import java.text.DateFormat
import java.text.DateFormatSymbols
import  org.codehaus.groovy.grails.plugins.web.taglib.FormTagLib
class LucasianTagLib extends FormTagLib  {
    //static defaultEncodeAs = 'html'
    static encodeAsForTags = [tagName: 'raw']
    static namespace = "llm"
    static mapeo = [

    ]
    def paginate = { attrs ->
        def writer = out
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }
        def messageSource = grailsAttributes.messageSource
        def locale = RCU.getLocale(request)

        def total = attrs.int('total') ?: 0
        def action = (attrs.action ? attrs.action : (params.action ? params.action : "index"))
        def offset = params.int('offset') ?: 0
        def max = params.int('max')
        def maxsteps = (attrs.int('maxsteps') ?: 10)

        if (!offset) offset = (attrs.int('offset') ?: 0)
        if (!max) max = (attrs.int('max') ?: 10)

        def linkParams = [:]
        if (attrs.params) linkParams.putAll(attrs.params)
        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) linkParams.sort = params.sort
        if (params.order) linkParams.order = params.order

        def linkTagAttrs = [action:action]
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        //add the mapping attribute if present
        if (attrs.mapping) {
            linkTagAttrs.mapping = attrs.mapping
        }

        linkTagAttrs.params = linkParams

        def cssClasses = "pagination"
        if (attrs.class) {
            cssClasses = "pagination " + attrs.class
        }

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = (offset / max) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max))
        writer<<"<div class=\"row\">"
        writer<<"<div class=\"col-sm-6\">"
        writer<<"<div class=\"dataTables_info\" >"
        if(currentstep == laststep){
            writer<<"Mostrando ${(currentstep-1)*max} a  ${total} de ${total} resultados"
        }else{
            writer<<"Mostrando ${(currentstep-1)*max} a  ${currentstep*max} de ${total} resultados"
        }
        writer<<"</div>"
        writer<<"</div>"
        writer<<"<div class=\"col-sm-6\">"
        writer << "<ul class=\"${cssClasses}\">"
        // display previous link when not on firststep
        if (currentstep > firststep) {
            linkParams.offset = offset - max
            writer << '<li class="prev">'
            writer << link(linkTagAttrs.clone()) {
                (attrs.prev ?: messageSource.getMessage('paginate.prev', null, '&laquo;', locale))
            }
            writer << '</li>'
        }
        else {
            writer << '<li class="prev disabled">'
            writer << '<span>'
            writer << (attrs.prev ?: messageSource.getMessage('paginate.prev', null, '&laquo;', locale))
            writer << '</span>'
            writer << '</li>'
        }

        // display steps when steps are enabled and laststep is not firststep
        if (steps && laststep > firststep) {
            linkTagAttrs.class = 'step'

            // determine begin and endstep paging variables
            int beginstep = currentstep - Math.round(maxsteps / 2) + (maxsteps % 2)
            int endstep = currentstep + Math.round(maxsteps / 2) - 1

            if (beginstep < firststep) {
                beginstep = firststep
                endstep = maxsteps
            }
            if (endstep > laststep) {
                beginstep = laststep - maxsteps + 1
                if (beginstep < firststep) {
                    beginstep = firststep
                }
                endstep = laststep
            }

            // display firststep link when beginstep is not firststep
            if (beginstep > firststep) {
                linkParams.offset = 0
                writer << '<li>'
                writer << link(linkTagAttrs.clone()) {firststep.toString()}
                writer << '</li>'
                writer << '<li class="disabled"><span>...</span></li>'
            }

            // display paginate steps
            (beginstep..endstep).each { i ->
                if (currentstep == i) {
                    writer << "<li class=\"active\">"
                    writer << "<span>${i}</span>"
                    writer << "</li>";
                }
                else {
                    linkParams.offset = (i - 1) * max
                    writer << "<li>";
                    writer << link(linkTagAttrs.clone()) {i.toString()}
                    writer << "</li>";
                }
            }

            // display laststep link when endstep is not laststep
            if (endstep < laststep) {
                writer << '<li class="disabled"><span>...</span></li>'
                linkParams.offset = (laststep -1) * max
                writer << '<li>'
                writer << link(linkTagAttrs.clone()) { laststep.toString() }
                writer << '</li>'
            }
        }

        // display next link when not on laststep
        if (currentstep < laststep) {
            linkParams.offset = offset + max
            writer << '<li class="next">'
            writer << link(linkTagAttrs.clone()) {
                (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, '&raquo;', locale))
            }
            writer << '</li>'
        }
        else {
            linkParams.offset = offset + max
            writer << '<li class="disabled">'
            writer << '<span>'
            writer << (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, '&raquo;', locale))
            writer << '</span>'
            writer << '</li>'
        }

        writer << '</ul>'
        writer<<"</div>"
        writer<<"</div>"
    }
    /**
     * Call this using:
     <llm:sliderPorcentaje
     field = "porcentaje"
     label = "Porcentaje"
     defaultLabel ="DefaultLabelPorcentaje"
     value = "${fieldValue(bean: impuestoInstance, field: 'porcentaje')}"
     color = "orange" />
     */
    def sliderPorcentaje = { attrs ->
        def writer = out
        def field
        def label
        def defaultLabel
        def required = false
        def value
        def color
        if(attrs.field){
            field = attrs.field
        }
        if(attrs.label)
        {
            label = attrs.label
        }
        if(attrs.defaultLabel)
        {
            defaultLabel = attrs.defaultLabel
        }
        if(attrs.required){
            required = attrs.boolean('required')
        }
        if(attrs.value){
            value = attrs.double('value')
        }
        else{
            value = 0.0
        }
        if(attrs.color){
            color = attrs.color
        }
        writer << '<label for="'
        writer << "increment-amount-" + field
        writer << '"'
        writer << ' class="col-sm-2 control-label">'
        writer << g.message([code: label, default: defaultLabel])
        writer << '</label>'

        writer << '<div class = "col-sm-10">'
        writer << g.field([type: "number decimal", step: ".5", name: field, class: "slider-input",
                           id: ("increment-amount-" + field),
                           value: value, required: required, readonly: "readonly"])


        writer << '<br><br><div class="col-sm-4 slider-'
        writer << color
        writer << '" id = "slider-'
        writer << field
        writer << '"></div>'
        writer << '</div>'

        //Write own custom jQuery function for slider imp
        writer << '<script type="text/javascript">'
        writer << '$(function() {'
        writer << '$("#slider-'
        writer << field
        writer << '").slider({'
        writer << 'range: "min",'
        writer << 'value: ' + value + ','
        writer << 'min: 0,'
        writer << 'max: 100,'
        writer << 'step: .5,'
        writer << 'animate: true,'
        writer << 'slide: function(event, ui) {'
        writer << '$("#increment-amount-' + field + '").val(ui.value);}'
        writer << '});'

        writer << '$("#increment-amount-' + field + '").val($("#slider-' + field + '").slider("value"));'
        writer << '});'
        writer << '</script>'
    }
    def printError = { attrs ->
        def bean = attrs.bean
        def table = false
        if(attrs.table){
            table = true
        }
        def writter = out
        if(bean != null){
            if(bean.hasErrors()){
                def fieldError = bean.errors.getFieldError(attrs.field)
                if(fieldError != null){
                    if(table){
                        writter << '<span class=" has-error"><span class="help-block" style="display:block;"><i class="fa fa-warning"></i> '
                    }else{
                        writter << '<span class=" has-error"><span class="help-block" style="display:inline;"><i class="fa fa-warning"></i> '
                    }

                    writter << g.message(code:fieldError.getCode(), default: fieldError.getDefaultMessage())
                    writter<<'</span></span>'
                }
            }
        }
    }
    def printGeneralErrors = {attrs->
        def bean = attrs.bean
        def writter = out
        if(bean!= null){
            if(bean.hasErrors()){
                def generalErrors = bean.errors.getGlobalErrors()
                if(generalErrors != []){
                    writter << '<div class="alert alert-danger">'
                    generalErrors.each(){
                        writter<<g.message(error: it)
                    }
                    writter << '</div>'
                }
            }
        }
    }
    def checkBoxList = {attrs, body ->
        def from = attrs.from
        def value = attrs.value
        def cname = attrs.name
        def isChecked, ht, wd, style, html

        //  sets the style to override height and/or width if either of them
        //  is specified, else the default from the CSS is taken
        style = "style='"
        if(attrs.height)
            style += "height:${attrs.height};"
        if(attrs.width)
            style += "width:${attrs.width};"

        if (style.length() == "style='".length())
            style = ""
        else
            style += "'" // closing single quote

        html = "<ul class='CheckBoxList' " + style + ">"

        out << html

        from.each { obj ->

            // if we wanted to select the checkbox using a click anywhere on the label (also hover effect)
            // but grails does not recognize index suffix in the name as an array:
            //      cname = "${attrs.name}[${idx++}]"
            //      and put this inside the li: <label for='$cname'>...</label>

            isChecked = (value?.contains(obj."${attrs.optionKey}"))? true: false

            out << "<li>" <<
                    checkBox(name:cname, value:obj."${attrs.optionKey}", checked: isChecked) <<
                    "${obj}" << "</li>"
        }

        out << "</ul>"

    }
    def form = {attrs, body ->
        def writter= out
        out<<'<p class="text-primary">Los campos marcados con * son requeridos</p><br/>'
        out<<g.form(attrs, body)
    }
    def uploadForm= {attrs, body->
        def writter= out
        out<<'<p class="text-primary">Los campos marcados con * son requeridos</p><br/>'
        out<<g.uploadForm(attrs, body)
    }
    def fortnightPicker = { attrs ->
        def out = out // let x = x ?
        def xdefault = attrs['default']
        if (xdefault == null) {
            xdefault = new Date()
        }
        else if (xdefault.toString() != 'none') {
            if (xdefault instanceof String) {
                xdefault = DateFormat.getInstance().parse(xdefault)
            }
            else if (!(xdefault instanceof Date)) {
                throwTagError("Tag [datePicker] requires the default date to be a parseable String or a Date")
            }
        }
        else {
            xdefault = null
        }

        def value = attrs.value
        if (value.toString() == 'none') {
            value = null
        }
        else if (!value) {
            value = xdefault
        }
        def name = attrs.name
        def id = attrs.id ?: name

        def noSelection = attrs.noSelection
        if (noSelection != null) {
            noSelection = noSelection.entrySet().iterator().next()
        }

        def day
        def month
        def year
        def hour
        def minute
        def fortnight
        def years
        def dfs = new DateFormatSymbols(RCU.getLocale(request))

        def c = null
        if (value instanceof Calendar) {
            c = value
        }
        else if (value != null) {
            c = new GregorianCalendar()
            c.setTime(value)
        }

        if (c != null) {
            day = c.get(GregorianCalendar.DAY_OF_MONTH)
            month = c.get(GregorianCalendar.MONTH)
            year = c.get(GregorianCalendar.YEAR)
            hour = c.get(GregorianCalendar.HOUR_OF_DAY)
            minute = c.get(GregorianCalendar.MINUTE)
            if(day <= 15){
                fortnight = 1
            }else{
                fortnight = 2
            }
        }

        if (years == null) {
            def tempyear

            def tempc = new GregorianCalendar()
            tempc.setTime(new Date())
            tempyear = tempc.get(GregorianCalendar.YEAR)
            years = (tempyear + 100)..(tempyear - 100)

        }

        booleanToAttribute(attrs, 'disabled')
        booleanToAttribute(attrs, 'readonly')

        // Change this hidden to use requestDataValueProcessor
        def dateStructValue = processFormFieldValueIfNecessary("${name}","date.struct","hidden")
        out.println "<input type=\"hidden\" name=\"${name}\" value=\"${dateStructValue}\" />"

        // create day select
        out.println "<select class=\"fortnight\" name=\"${name}_fortnight\" id=\"${id}_fortnight\""
        if (attrs.disabled) {
            out << ' disabled="disabled"'
        }
        if (attrs.readonly) {
            out << ' readonly="readonly"'
        }
        out << '>'

        if (noSelection) {
            renderNoSelectionOptionImpl(out, noSelection.key, noSelection.value, '')
            out.println()
        }

        for (i in 1..2) {
            // Change this option to use requestDataValueProcessor
            def dayIndex = processFormFieldValueIfNecessary("${name}_fortnight","${i}","option")
            out.println "<option value=\"${dayIndex}\"${i == fortnight ? ' selected="selected"' : ''}>${i}° quincena</option>"
        }
        out.println '</select>'
        // create month select
        out.println "<select class=\"fortnight\" name=\"${name}_month\" id=\"${id}_month\""
        if (attrs.disabled) {
            out << ' disabled="disabled"'
        }
        if (attrs.readonly) {
            out << ' readonly="readonly"'
        }
        out << '>'

        if (noSelection) {
            renderNoSelectionOptionImpl(out, noSelection.key, noSelection.value, '')
            out.println()
        }

        dfs.months.eachWithIndex {m, i ->
            if (m) {
                def monthIndex = i + 1
                monthIndex = processFormFieldValueIfNecessary("${name}_month","${monthIndex}","option")
                out.println "<option value=\"${monthIndex}\"${i == month ? ' selected="selected"' : ''}>$m</option>"
            }
        }
        out.println '</select>'

        // create year select
        out.println "<select class=\"fortnight\" name=\"${name}_year\" id=\"${id}_year\""
        if (attrs.disabled) {
            out << ' disabled="disabled"'
        }
        if (attrs.readonly) {
            out << ' readonly="readonly"'
        }
        out << '>'

        if (noSelection) {
            renderNoSelectionOptionImpl(out, noSelection.key, noSelection.value, '')
            out.println()
        }

        for (i in years) {
            // Change this year option to use requestDataValueProcessor
            def yearIndex  = processFormFieldValueIfNecessary("${name}_year","${i}","option")
            out.println "<option value=\"${yearIndex}\"${i == year ? ' selected="selected"' : ''}>${i}</option>"
        }
        out.println '</select>'

    }
    private processFormFieldValueIfNecessary(name, value, type) {
        if (requestDataValueProcessor != null) {
            value = requestDataValueProcessor.processFormFieldValue(request, name, "${value}", type)
        }
        return value
    }
    def breadCrumbs = {attrs, body ->
        def uri = request.forwardURI.replace(request.contextPath, "")
        if(attrs.elementoId != null && attrs.elementoId != ""){
            uri = uri.substring(0,uri.lastIndexOf("/"))
        }
        def locale = RCU.getLocale(request)
        def messageSource = grailsAttributes.messageSource
        def parts
        def crumbURL = ""
        out.println '<ol class="breadcrumb">'
        def home = request.getContextPath().replace("/","")
        if(mapeo[uri]){
            parts = mapeo[uri]
            parts.each(){item->
                if(item == "id"){
                    crumbURL = crumbURL
                    out.println generateCrumb(crumbURL+"/edit/"+attrs.elementoId,attrs.elementoName)
                }else if(item == parts.last()){
                    out.println generateCrumb("",messageSource.getMessage("crumbs."+item,null,item, locale))
                }else if(item == parts.first()){
                    crumbURL = crumbURL + "/"+request.getContextPath().replaceFirst("/","")
                    out.println generateCrumb(crumbURL, ' <i class= "fa fa-home"></i> Home ')
                }else{
                    if(item.contains("+id")){
                        item = item.replace("+id","")
                        crumbURL = crumbURL + "/"+item
                        out.println generateCrumb(crumbURL+"/"+attrs.elementoId,messageSource.getMessage("crumbs."+item,null,item, locale) )
                    }else{
                        crumbURL = crumbURL + "/"+item
                        out.println generateCrumb(crumbURL,messageSource.getMessage("crumbs."+item,null,item, locale) )
                    }
                }
            }
        }else{
            parts = request.forwardURI.replaceFirst("/","").replace("/edit","").split("/")
            parts.each(){item->
                if(item == parts.last()){
                    if(attrs.elementoId != null && attrs.elementoId != ""){
                        out.println generateCrumb("",attrs.elementoName)
                    }else{
                        out.println generateCrumb("",messageSource.getMessage("crumbs."+item,null,item, locale))
                    }
                }else if(item == parts.first()){
                    crumbURL = crumbURL + "/"+item
                    out.println generateCrumb(crumbURL, ' <i class= "fa fa-home"></i> Home ')
                }else{
                    crumbURL = crumbURL + "/"+item
                    out.println generateCrumb(crumbURL,messageSource.getMessage("crumbs."+item,null,item, locale) )
                }
            }
        }
        out.println '</ol>'
    }
    private generateCrumb( href, text){
        if(href.isEmpty()){
            '<li class="active">'+text+'</li>'
        }else{
            '<li> <a href="'+href+'">'+text+'</a></li>'
        }

    }

}
