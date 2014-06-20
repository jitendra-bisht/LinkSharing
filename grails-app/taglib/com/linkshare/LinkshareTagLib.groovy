package com.linkshare

import org.codehaus.groovy.grails.web.mapping.LinkGenerator
import org.codehaus.groovy.grails.web.mapping.UrlMapping
import org.springframework.web.servlet.support.RequestContextUtils

import java.text.SimpleDateFormat

class LinkshareTagLib {
    //static encodeAsForTags = [tagName: 'raw']
    static namespace = "ls"

    def dateFormat={attrs->
        if(attrs.format && attrs.value){
            SimpleDateFormat sdf = new SimpleDateFormat(attrs.format);
            out << sdf?.format(attrs.value)
        }
    }

    def isRole={attrs,body->
        User user = attrs.user;
        if(user && attrs.role){
            if(user.role.collect{it.roleName}.contains(attrs.role)){
                out << body();
            }
        }
    }

    Closure dateAsString = { attrs ->
        if(attrs.date){
            Date date1 = new Date();
            Date date2 = new Date(attrs.date.getTime());

            long diff = Math.abs(date1.getTime() - date2.getTime());
            long second = 1000;
            long minute = 60 * second;
            long hour = 60 * minute;
            long day = 24 * hour;
            long week = 7 * day;
            long month = 30 * day;
            long year = 12 * month;

            StringBuilder data = new StringBuilder();
            if(diff > year){
                data.append("${Math.round(diff/year)} year ");
                diff %= year;
            }
            if(diff > month){
                data.append("${Math.round(diff/month)} month ");
                diff %= month;
            }

            if(diff > week){
                data.append("${Math.round(diff/week)} week ")
                diff %= week;
            }

            if(diff > day){
                data.append("${Math.round(diff/day)} day ")
                diff %= day;
            }

            if(diff > hour){
                data.append("${Math.round(diff/hour)} hour ")
                diff %= hour;
            }

            if(diff > minute){
                data.append("${Math.round(diff/minute)} minute ")
                diff %= minute;
            }

            if(diff > second){
                data.append("${Math.round(diff/second)} second")
            }
            if(data.size() == 0)
                data.append("Just now")
            else
                data.append(" ago.")
            out << data.toString();
        }
    }

    Closure dateAsStringOneWord = { attrs ->
        if(attrs.date){
            Date date1 = new Date();
            Date date2 = new Date(attrs.date.getTime());

            long diff = Math.abs(date1.getTime() - date2.getTime());
            long second = 1000;
            long minute = 60 * second;
            long hour = 60 * minute;
            long day = 24 * hour;
            long week = 7 * day;
            long month = 30 * day;
            long year = 12 * month;

            StringBuilder data = new StringBuilder();
            if(diff > year){
                data.append("${Math.round(diff/year)} year ");
                diff %= year;
            }
            else if(diff > month){
                data.append("${Math.round(diff/month)} month ");
                diff %= month;
            }

            else if(diff > week){
                data.append("${Math.round(diff/week)} week ")
                diff %= week;
            }

            else if(diff > day){
                data.append("${Math.round(diff/day)} day ")
                diff %= day;
            }

            else if(diff > hour){
                data.append("${Math.round(diff/hour)} hour ")
                diff %= hour;
            }

            else if(diff > minute){
                data.append("${Math.round(diff/minute)} minute ")
                diff %= minute;
            }

            else if(diff > second){
                data.append("${Math.round(diff/second)} second")
            }
            if(data.size() == 0)
                data.append("Just now")
            else
                data.append(" ago.")
            out << data.toString();
        }
    }

    Closure paginate = { attrs ->
        def writer = out
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }

        def messageSource = grailsAttributes.messageSource
        def locale = RequestContextUtils.getLocale(request)

        def total = attrs.int('total') ?: 0
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

        def linkTagAttrs = [:]
        def action
        if (attrs.containsKey('mapping')) {
            linkTagAttrs.mapping = attrs.mapping
            action = attrs.action
        } else {
            action = attrs.action ?: params.action
        }
        if (action) {
            linkTagAttrs.action = action
        }
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.containsKey(UrlMapping.PLUGIN)) {
            linkTagAttrs.put(UrlMapping.PLUGIN, attrs.get(UrlMapping.PLUGIN))
        }
        if (attrs.containsKey(UrlMapping.NAMESPACE)) {
            linkTagAttrs.put(UrlMapping.NAMESPACE, attrs.get(UrlMapping.NAMESPACE))
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        linkTagAttrs.params = linkParams

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = (offset / max) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max))
        writer << "<ul class='pagination'>";
        // display previous link when not on firststep unless omitPrev is true
        if (currentstep > firststep && !attrs.boolean('omitPrev')) {
            linkTagAttrs.class = 'prevLink'
            linkParams.offset = offset - max
            writer << lslink(linkTagAttrs.clone()) {
                (attrs.prev ?: messageSource.getMessage('paginate.prev', null, messageSource.getMessage('default.paginate.prev', null, 'Previous', locale), locale))
            }
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
            if (beginstep > firststep && !attrs.boolean('omitFirst')) {
                linkParams.offset = 0
                writer << lslink(linkTagAttrs.clone()) {firststep.toString()}
            }
            //show a gap if beginstep isn't immediately after firststep, and if were not omitting first or rev
            if (beginstep > firststep+1 && (!attrs.boolean('omitFirst') || !attrs.boolean('omitPrev')) ) {
                writer << '<span class="step gap">..</span>'
            }

            // display paginate steps
            (beginstep..endstep).each { i ->
                if (currentstep == i) {
                    writer << "<li class=\"active\"><a href='#'>${i}</a></li>"
                }
                else {
                    linkParams.offset = (i - 1) * max
                    writer << lslink(linkTagAttrs.clone()) {i.toString()}
                }
            }

            //show a gap if beginstep isn't immediately before firststep, and if were not omitting first or rev
            if (endstep+1 < laststep && (!attrs.boolean('omitLast') || !attrs.boolean('omitNext'))) {
                writer << '<span class="step gap">..</span>'
            }
            // display laststep link when endstep is not laststep
            if (endstep < laststep && !attrs.boolean('omitLast')) {
                linkParams.offset = (laststep - 1) * max
                writer << lslink(linkTagAttrs.clone()) { laststep.toString() }
            }
        }

        // display next link when not on laststep unless omitNext is true
        if (currentstep < laststep && !attrs.boolean('omitNext')) {
            linkTagAttrs.class = 'nextLink'
            linkParams.offset = offset + max
            writer << lslink(linkTagAttrs.clone()) {
                (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, messageSource.getMessage('default.paginate.next', null, 'Next', locale), locale))
            }
        }
        writer << "</ul>";
    }
    Closure lslink = { attrs, body ->

        def writer = getOut()
        def elementId = attrs.remove('elementId')
        def linkAttrs
        if (attrs.params instanceof Map && attrs.params.containsKey('attrs')) {
            linkAttrs = attrs.params.remove('attrs').clone()
        }
        else {
            linkAttrs = [:]
        }
        writer <<  '<li><a href=\"'
        writer << createLink(attrs).encodeAsHTML()
        writer << '"'
        if (elementId) {
            writer << " id=\"${elementId}\""
        }
        attrs.remove(UrlMapping.PLUGIN)
        attrs.remove(UrlMapping.NAMESPACE)
        def remainingKeys = attrs.keySet() - LinkGenerator.LINK_ATTRIBUTES
        for (key in remainingKeys) {
            writer << " " << key << "=\"" << attrs[key]?.encodeAsHTML() << "\""
        }
        for (entry in linkAttrs) {
            writer << " " << entry.key << "=\"" << entry.value?.encodeAsHTML() << "\""
        }
        writer << '>'
        writer << body()
        writer << '</a></li>'
    }
}
