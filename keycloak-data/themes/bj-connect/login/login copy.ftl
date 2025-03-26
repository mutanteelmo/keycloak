<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <!-- ${msg("loginAccountTitle")} -->
    <#elseif section = "form">                
        <div class="lg:hidden max-h-[450px]">
            <div>
                <img src="${url.resourcesPath}/images/bjtinha-2x.png"
                    class="aspect-auto w-[137px] h-[112px] top-[1rem] right-10 absolute lg:hidden" />
            </div>

            <div class="
                bg-[url('${url.resourcesPath}/images/fundo_mobile492.svg')] 
                lg:hidden
                bg-cover
                bg-center
                bg-no-repeat
                h-[512px]
                w-full
                flex justify-center items-center">

                <img src="${url.resourcesPath}/images/logo-bjconnect.png" class="aspect-auto w-[50%] -mt-[10rem] absolute lg:hidden" />

                <img src="${url.resourcesPath}/images/frei.png" class="aspect-auto w-64 h-64 lg:hidden absolute left-0 top-[14rem]" />
            </div>
        </div>

        <div class="hidden lg:flex relative justify-center">
            <img src="${url.resourcesPath}/images/fundo-desktop-verde.png" class="absolute bottom-0 left-0 w-full h-[696px] transform translate-x-8 rounded-3xl"/>

            <img src="${url.resourcesPath}/images/bjtinha-voo.png" class="absolute -top-16 -right-16 w-auto h-64 transform translate-x-8"/>

            <img src="${url.resourcesPath}/images/frei-custom.png" class="absolute left-0 -bottom-10 w-96 h-auto">
        </div>

        <div class="lg:hidden absolute top-[26rem] bg-white w-full h-24 rounded-t-[43px] z-10"></div>

        <div class="bg-white p-8 rounded-[43px] w-full lg:max-w-md mx-auto -mt-[24rem]:xl lg:-mt-20 relative z-10">
            <div class="flex justify-center mt-10 lg:mt-40 hidden lg:flex">
                <img src="${url.resourcesPath}/images/logo-bjconnect-principal.png" alt="BJ Connect" class="h-24 hidden lg:flex">
            </div>

            <h2 class="text-2xl font-semibold text-center text-gray-700 mb-6  lg:mt-10">Acesse sua conta</h2>
            
            <#if realm.password>
                <form id="kc-form-login" class="" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <!-- Campo Login com Label e ícone de interrogação -->
                    <div class="mb-4">
                        <div class="flex justify-between items-center">
                            <label for="username" class="text-sm text-[#747474] font-bold">Login: </label>
                            <span class="text-gray-500 cursor-pointer">
                                <img src="${url.resourcesPath}/images/icon-question.png" class="h-4">
                            </span>
                        </div>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" placeholder="Matrícula ou CPF" value="${(login.username!'')}" type="text" autofocus autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                    </div>
                    
                    <!-- Campo Senha com Label -->
                    <div class="mb-4">
                        <label for="password" class="block text-sm text-[#747474] mb-1 font-bold">Senha: </label>
                        <div class="relative">
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" placeholder="Digite sua senha" type="password" autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                        </div>
                    </div>
        
                    <!-- Botão Entrar -->
                    <div class="mb-4">
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                    </div>
        
                    <!-- Link Esqueceu sua Senha -->
                    <div class="text-center mb-16">
                        <a href="${url.loginResetCredentialsUrl}" class="text-sm text-[#747474] underline font-bold">Esqueceu sua senha?</a>
                    </div>

                    <div class="hidden lg:block text-center mt-10">
                        Ainda não está matriculado e gostaria de fazer <br>
                        parte do colégio Bom Jesus? 
                    </div>

                    <div class="hidden lg:block text-center mt-10">
                        <a href="#" class="text-sm text-[#747474] underline font-bold">Acesse nosso site</a>
                    </div>
                </form>
            </#if>
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
