<%--
  ~ Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~ WSO2 Inc. licenses this file to you under the Apache License,
  ~ Version 2.0 (the "License"); you may not use this file except
  ~ in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~    http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied.  See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
  --%>

<%@ include file="localize.jsp" %>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@ page import="org.wso2.carbon.identity.application.authentication.endpoint.util.AuthenticationEndpointUtil" %>
<%@ page import="java.io.File" %>

<%-- Include tenant context --%>
<jsp:directive.include file="init-url.jsp"/>
<%-- Branding Preferences --%>
<jsp:directive.include file="branding-preferences.jsp"/>


<%-- Extract the name of the stylesheet--%>
<%
    String themeName = "wso2is";
    File themeDir = new File(request.getSession().getServletContext().getRealPath("/")
        + "/" + "libs/themes/" + themeName + "/");
    String[] fileNames = themeDir.list();
    String themeFileName = "";

    for(String file: fileNames) {
        if(file.endsWith("min.css")) {
            themeFileName = file;
        }
    }
%>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- Updates the favicon with the URL resolved in branding-preferences --%>
<link rel="icon" href="<%= StringEscapeUtils.escapeHtml4(faviconURL) %>" type="image/x-icon"/>

<%-- Load the base theme --%>
<link href="libs/themes/wso2is/<%= themeFileName %>" rel="stylesheet">

<%-- Load Default Theme Skeleton --%>
<jsp:include page="theme-skeleton.jsp"/>

<%-- If an override stylesheet is defined in branding-preferences, applying it... --%>
<% if (overrideStylesheet != null) { %>
<link rel="stylesheet" href="<%= StringEscapeUtils.escapeHtml4(overrideStylesheet) %>">
<% } %>

<%-- Layout specific style sheet --%>
<%
    String tempStyleFilePath = "";
    if (StringUtils.startsWith(layout, "custom-")) {
        if (StringUtils.equals(layout, "custom-" + tenantRequestingPreferences)) {
            tempStyleFilePath = layoutStoreURL.replace("${tenantDomain}", tenantRequestingPreferences) + "/styles.css";
        } else if (StringUtils.equals(layout, "custom-" + tenantRequestingPreferences + "-" + applicationRequestingPreferences)) {
            tempStyleFilePath = layoutStoreURL.replace("${tenantDomain}", tenantRequestingPreferences) + "/apps/" + applicationRequestingPreferences + "/styles.css";
        }
    } else {
        tempStyleFilePath = "includes/layouts/" + layout + "/styles.css";
    }

    if (config.getServletContext().getResource(tempStyleFilePath) != null) {
        styleFilePath = tempStyleFilePath;
    }
%>
    
<link rel="stylesheet" href="<%= styleFilePath %>">

<%-- Updates the site tile with the text resolved in branding-preferences --%>
<title><%= StringEscapeUtils.escapeHtml4(siteTitle) %></title>

<%-- Downtime banner --%>
<%
    if (config.getServletContext().getResource("extensions/planned-downtime-banner.jsp") != null) {
%>
        <jsp:include page="extensions/planned-downtime-banner.jsp"/>
<%
    }
%>

<script src="libs/jquery_3.6.0/jquery-3.6.0.min.js"></script>

<style type="text/css">
    .grecaptcha-badge {
        bottom: 55px !important;
    }
    @media only screen and (max-width: 767px) {
        .grecaptcha-badge {
            bottom: 100px !important;
        }
    }
</style>