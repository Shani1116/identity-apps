<%--
  ~ Copyright (c) 2021-2023, WSO2 LLC. (https://www.wso2.com).
  ~
  ~ WSO2 LLC. licenses this file to you under the Apache License,
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

<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.wso2.carbon.identity.mgt.endpoint.util.IdentityManagementEndpointUtil" %>

<%-- Include tenant context --%>
<jsp:directive.include file="../tenant-resolve.jsp"/>

<%-- Branding Preferences --%>
<jsp:directive.include file="./branding-preferences.jsp"/>

<%-- Localization --%>
<jsp:directive.include file="./localize.jsp" />

<%
    if (!StringUtils.isBlank(cookiePolicyURL)) {
%>
<div id="cookie-consent-banner" data-testid="cookie-consent-banner" class="ui segment cookie-consent-banner inverted aligned-right hidden transition">
    <div class="banner-image" data-testid="cookie-consent-banner-image">
        <div class="theme-icon floated-left hover-rounded tiny transparent cookie-icon" data-testid="generic-icon">
            <svg class="icon" width="14" height="14" viewBox="0 0 514.374 514.374">
                <path class="path" d="M171.277 17.756A185.963 185.963 0 01203.153 15c7.847 0 15.584.503 23.187 1.465l-6.036 14.563c-3.619 8.734-2.347 18.86 3.321 26.426 5.115 6.831 13.219 10.768 21.594 10.768 1.712 0 3.436-.165 5.146-.502l9.026-1.782a26.876 26.876 0 0020.472-18.39l4.279-13.734c57.572 28.316 98.536 85.863 102.74 153.728a7.5 7.5 0 1014.971-.928C395.372 81.971 308.092 0 203.153 0c-11.53 0-23.123 1.002-34.454 2.98a7.5 7.5 0 102.578 14.776zm94.265 25.33a11.89 11.89 0 01-9.056 8.136l-9.026 1.782c-4.462.879-9.104-.902-11.829-4.542a11.952 11.952 0 01-1.47-11.691l7.348-17.73a182.859 182.859 0 0128.821 8.678zM97.583 349.933c-49.174-34.484-78.531-90.87-78.531-150.832 0-77.761 49.211-147.491 122.456-173.515a7.501 7.501 0 00-5.021-14.135C57.274 39.596 4.052 115.006 4.052 199.101c0 64.847 31.745 125.824 84.918 163.113a7.465 7.465 0 004.3 1.36 7.5 7.5 0 004.313-13.641z"></path><path class="path" d="M481.048 211.363a14.95 14.95 0 00-12.647-7.17c-5.266-.065-10.203 2.587-13.093 7.075-5.885 9.135-15.873 14.588-26.718 14.588a31.83 31.83 0 01-23.517-10.416c-4.986-5.491-12.764-7.403-19.815-4.875a34.93 34.93 0 01-11.82 2.046c-19.355 0-35.103-15.747-35.103-35.091l.003-2.071c.012-8.067-5.051-15.283-12.597-17.957-9.541-3.381-15.952-12.458-15.952-22.572l.006-3.241a14.746 14.746 0 00-4.761-10.862 14.796 14.796 0 00-11.254-3.83c-64.588 5.608-122.569 42.597-155.1 98.945-.105.183-.203.37-.293.561l-13.642 29.031c-.089.19-.171.384-.244.582-15.041 40.556-16.387 84.891-3.891 128.213 16.089 55.775 74.32 114.578 129.81 131.083 20.105 5.98 40.585 8.974 60.83 8.973 18.536 0 36.876-2.51 54.544-7.536a7.5 7.5 0 00-4.104-14.428c-34.22 9.734-71.219 9.253-106.994-1.388-50.286-14.957-105.09-70.305-119.674-120.862-11.57-40.112-10.381-81.099 3.435-118.547l13.369-28.452c30.065-51.877 83.47-85.946 142.967-91.206l-.005 2.952c0 16.468 10.426 31.226 25.942 36.724 1.562.553 2.608 2.079 2.606 3.796l-.003 2.082c0 27.626 22.476 50.102 50.103 50.102 5.789 0 11.47-.985 16.884-2.927 1.342-.48 2.739-.16 3.647.84 8.85 9.743 21.469 15.331 34.621 15.331 15.967 0 30.669-8.024 39.328-21.465.165-.256.356-.195.345-.184 17.702 28.856 27.059 62.091 27.059 96.111 0 35.359-10.048 69.702-29.059 99.314-18.518 28.846-44.601 51.92-75.429 66.73a7.5 7.5 0 106.495 13.521c33.335-16.013 61.537-40.961 81.557-72.147 20.565-32.035 31.436-69.179 31.436-107.417.002-36.791-10.12-72.738-29.272-103.956zM132.273 119.812a19.407 19.407 0 0013.812 5.722c10.771 0 19.534-8.763 19.534-19.534V79.544c0-10.771-8.763-19.533-19.534-19.533H131.33c-10.771 0-19.534 8.763-19.534 19.533v11.7a19.404 19.404 0 005.722 13.812zm-5.477-40.268c0-2.5 2.034-4.533 4.534-4.533h14.755c2.5 0 4.534 2.034 4.534 4.533V106a4.54 4.54 0 01-4.534 4.534 4.503 4.503 0 01-3.205-1.328l-14.755-14.755a4.506 4.506 0 01-1.329-3.206zM92.299 199.057c6.321-6.195 7.868-15.656 3.851-23.542l-2.169-4.257c-4.287-8.417-13.68-12.694-22.845-10.403l-6.848 1.712c-6.092 1.523-11.197 5.882-13.656 11.66l-1.827 4.294a20.163 20.163 0 006.214 23.832l5.062 3.916a20.082 20.082 0 0012.313 4.188c5.132 0 10.246-1.936 14.122-5.734zM81.8 188.344l-5.781 5.666a5.174 5.174 0 01-6.76.395l-5.062-3.917a5.154 5.154 0 01-1.589-6.093l1.827-4.294a5.18 5.18 0 013.492-2.981l6.848-1.712a5.127 5.127 0 015.841 2.66l2.169 4.257a5.132 5.132 0 01-.985 6.019z"></path><path class="path" d="M226.195 285.933c-2.69 6.346-2.375 13.474.864 19.558s8.978 10.325 15.744 11.635l14.477 2.804a22.817 22.817 0 0017.705-3.942 22.807 22.807 0 009.186-15.64l1.442-11.892c1.215-10.02-4.431-19.758-13.729-23.682l-10.233-4.319c-11.53-4.866-24.885.55-29.771 12.071zm13.81 5.855l5.685-13.407c1.247-2.943 4.119-4.714 7.133-4.714 1.001 0 2.018.195 2.995.608l10.233 4.319a7.767 7.767 0 014.671 8.056l-1.442 11.892a7.66 7.66 0 01-3.125 5.321 7.653 7.653 0 01-6.023 1.341l-14.477-2.804a7.696 7.696 0 01-5.355-3.958 7.7 7.7 0 01-.295-6.654zM395.671 407.602l12.662-15.051a22.864 22.864 0 00-1.011-30.618l-10.824-11.266c-4.299-4.475-10.083-6.974-16.288-7.036-6.172-.091-12.04 2.32-16.428 6.708l-12.521 12.519c-8.134 8.134-8.957 21.126-1.915 30.222l10.681 13.797a22.807 22.807 0 0018.123 8.884 22.797 22.797 0 0017.521-8.159zm-17.689-6.842a7.874 7.874 0 01-6.093-3.065l-10.681-13.797a7.924 7.924 0 01.66-10.433l12.521-12.519a7.844 7.844 0 015.589-2.316h.082a7.846 7.846 0 015.622 2.428l10.824 11.265a7.893 7.893 0 01.349 10.569l-12.662 15.051a7.945 7.945 0 01-6.211 2.817zM372.829 310.49c5.977 0 11.294-3.11 14.224-8.319 2.929-5.209 2.825-11.368-.279-16.475l-8.315-13.68a16.262 16.262 0 00-17.801-7.38l-9.601 2.335a16.26 16.26 0 00-12.297 18.163l1.621 11.347c1.143 7.987 8.087 14.009 16.154 14.009zm-17.599-16.131l-1.621-11.346a1.313 1.313 0 01.993-1.467l9.6-2.335h.001a1.31 1.31 0 011.436.596l8.315 13.681c.266.437.273.885.023 1.331-.251.446-.638.672-1.149.672h-16.294a1.326 1.326 0 01-1.304-1.132zM462.234 327.042a18.128 18.128 0 00-.511-14.034l-5.433-11.809a18.333 18.333 0 00-10.694-9.651 18.334 18.334 0 00-14.364 1.108l-7.131 3.735a18.13 18.13 0 00-8.997 10.861 18.125 18.125 0 001.427 14.03l5.994 11.03c3.278 6.033 9.588 9.525 16.105 9.525 2.498 0 5.028-.513 7.428-1.593l6.571-2.957a18.137 18.137 0 009.605-10.245zm-14.047-5.262a3.242 3.242 0 01-1.713 1.828l-6.571 2.957a3.27 3.27 0 01-4.198-1.415l-5.994-11.031c-.567-1.043-.403-2.016-.255-2.503s.554-1.387 1.605-1.938l7.132-3.736a3.234 3.234 0 012.562-.197 3.234 3.234 0 011.908 1.722l5.433 11.809a3.244 3.244 0 01.091 2.504zM244.91 418.475l10.68 4.665a23.86 23.86 0 009.573 2.006c8.774 0 17.199-4.834 21.408-13.117l5.105-10.046c2.954-5.815 3.424-12.417 1.322-18.592-2.102-6.174-6.501-11.119-12.389-13.923l-10.494-4.999c-11.82-5.631-25.736-.903-31.68 10.76l-5.291 10.38a24.074 24.074 0 00-1.213 18.973 24.085 24.085 0 0012.979 13.893zm1.598-26.055l5.292-10.38a8.93 8.93 0 017.972-4.917c1.303 0 2.63.286 3.893.887l10.494 4.999a8.906 8.906 0 014.64 5.215 8.91 8.91 0 01-.495 6.963l-5.105 10.046c-2.152 4.236-7.251 6.063-11.603 4.162l-10.68-4.666c-2.292-1.001-4.018-2.849-4.86-5.204s-.682-4.877.452-7.105zM249.796 220.599h10.427c8.156 0 15.107-5.557 16.903-13.512l4.353-19.274a17.285 17.285 0 00-5.653-16.999 17.289 17.289 0 00-17.677-2.913l-14.778 5.901c-6.624 2.645-10.903 8.962-10.903 16.094v13.374c-.001 9.555 7.773 17.329 17.328 17.329zm-2.329-30.703c0-.959.575-1.808 1.466-2.164l14.778-5.901c.323-.129.622-.181.894-.181.685 0 1.197.328 1.482.572.4.341 1.03 1.091.761 2.285l-4.353 19.275a2.318 2.318 0 01-2.272 1.816h-10.427a2.332 2.332 0 01-2.329-2.329zM217.687 87.911h-7.778c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h7.778c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5zM294.273 75.346c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h9.573c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5zM119.621 158.555h11.908c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-11.908c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5zM65.712 244.073c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h7.059c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5zM80.67 128.04c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-7.899c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5zM206.041 244.393a7.5 7.5 0 00-7.5-7.5h-8.975c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h8.975a7.5 7.5 0 007.5-7.5zM198.541 358.63h7.778c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-7.778c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5zM311.221 346.429c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-12.162c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5zM308.034 463.102h7.181c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-7.181c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5zM446.247 367.328h-7.393c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h7.393a7.5 7.5 0 000-15z"></path>
            </svg>
        </div>
    </div>
    <div class="banner-content" data-testid="cookie-consent-banner-content">
        <div class="title" data-testid="cookie-consent-banner-content-title">
            <%=IdentityManagementEndpointUtil.i18n(recoveryResourceBundle, "cookie.consent.banner.content")%>
            <a href="<%= i18nLink(userLocale, cookiePolicyURL) %>" target="_blank" rel="noopener noreferrer" data-testid="cookie-policy-link">
                <%=IdentityManagementEndpointUtil.i18n(recoveryResourceBundle, "Cookie.policy")%>
            </a>.
        </div>
    </div>
    <div class="actions" data-testid="cookie-consent-banner-actions">
        <button data-testid="cookie-consent-banner-confirm-button" class="ui fluid primary button" type="button" onclick="onCookieConsentClear(this)">
            <%=IdentityManagementEndpointUtil.i18n(recoveryResourceBundle, "cookie.consent.banner.clear")%>
        </button>
    </div>
</div>
<% } %>
