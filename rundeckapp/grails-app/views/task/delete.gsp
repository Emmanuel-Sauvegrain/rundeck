%{--
  - Copyright 2018 Rundeck, Inc. (http://rundeck.com)
  -
  - Licensed under the Apache License, Version 2.0 (the "License");
  - you may not use this file except in compliance with the License.
  - You may obtain a copy of the License at
  -
  -     http://www.apache.org/licenses/LICENSE-2.0
  -
  - Unless required by applicable law or agreed to in writing, software
  - distributed under the License is distributed on an "AS IS" BASIS,
  - WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  - See the License for the specific language governing permissions and
  - limitations under the License.
  --}%

<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: 1/30/18
  Time: 12:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="tabpage" content="triggers"/>
    <meta name="layout" content="base"/>
    <title><g:appTitle/> -
    <g:message code="Task.page.delete.title" /> - ${task.name ?: task.uuid}</title>
    <asset:javascript src="koBind.js"/>
    <asset:javascript src="ui/toggle.js"/>
    <asset:javascript src="ko/component/busy-spinner.js"/>
    <g:javascript>"use strict";

    jQuery(function () {
        initKoBind();
    })
    </g:javascript>
</head>

<body>
<g:form controller="task" useToken="true" action="deletePost" method="post" class="form form-horizontal"
        params="[project: task.project]">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span class="h3">
                <g:message code="Task.page.delete.confirm.message"/>
            </span>
        </div>

        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">
                    <g:message code="Task.domain.name.title"/>
                </label>

                <div class="col-sm-10">
                    <p class="form-control-static text-info"><g:enc>${task.name}</g:enc></p>
                </div>
            </div>

        </div>

        <div class="panel-footer" data-ko-controller="UIToggle">
            <g:hiddenField name="id" value="${task.uuid}"/>
            <span data-bind="visible: !value()">
                <g:actionSubmit value="Cancel"
                                action="cancel"
                                class="btn btn-default btn-sm "/>
                <input type="submit"
                       value="${g.message(code: 'Delete')}"
                       data-bind="click: toggle"
                   class="btn btn-danger btn-sm"/>
            </span>
            <busy-spinner params="busy: value, css: 'busy-spinner-danger'">
                <span class="text-danger"><g:message code="loading.deleting.message"/></span>
            </busy-spinner>
        </div>
    </div>
</g:form>
</body>
</html>