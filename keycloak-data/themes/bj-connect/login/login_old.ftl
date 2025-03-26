<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <!-- ${msg("loginAccountTitle")} -->
    <#elseif section = "form">                
        <img src="${url.resourcesPath}/images/fundo-login-2x.png" alt="" class="absolute w-full h-[75dvh] top-[25%] md:top-[15%] z-0" />

        <div class="relative flex min-h-screen justify-center items-center">
            <div class="w-[480px]">
                <div class="grid grid-flow-row auto-rows-max">
                    <div class="grid justify-items-center mt-24">
                        <img src="${url.resourcesPath}/images/logo-connect.png" alt="" class="w-[155px]" />
                    </div>

                    <div class="grid justify-items-end -mt-24">
                        <img src="${url.resourcesPath}/images/grupo-2x.png" alt="" class="h-[188px]" />
                    </div>
                </div>

                <div class="grid justify-items-center mt-[120px]">
                    <div class="text-center text-[#747474] text-xl font-bold">
                        Entrar na conta
                    </div>    
                </div>
                
                <#if messagesPerField.existsError('username','password')>
                    <div class="grid justify-items-center">
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </div>
                </#if>

                <#if realm.password>
                    <form id="kc-form-login" class="" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div class="grid justify-items-center space-y-4 pt-8 pr-8 pl-8">
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" placeholder="E-mail ou matrícula" value="${(login.username!'')}" type="text" autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />

                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                            <!-- <button class="pf-c-button pf-m-control" type="button" aria-label="${msg("showPassword")}"
                                    aria-controls="password"  data-password-toggle
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </button> -->
                        </div>

                        <div class="grid justify-items-left pl-8 pr-8 pt-2 pb-8">
                            <#if realm.rememberMe && !usernameHidden??>
                                <label class="inline-flex">
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="form-checkbox rounded-full bg-white text-[#747474]" checked>
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="form-checkbox rounded-full bg-white text-[#747474]">
                                    </#if>
                                    <span class="text-sm font-extralight ml-1 text-[#747474]">${msg("rememberMe")}</span>
                                </label>
                            </#if>
                            
                            <!-- Esqueci minha senha -->
                            <!-- <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div> -->
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </form>
                </#if>
            </div>
        </div>

        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} 
                        <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
                    </span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h4>${msg("identity-provider-login-label")}</h4>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
