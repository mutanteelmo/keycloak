<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "form">                
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
            <img src="${url.resourcesPath}/images/fundo-desktop-verde.png" class="relative bottom-0 left-0 w-full h-[696px] transform translate-x-8 rounded-3xl"/>

            <img src="${url.resourcesPath}/images/bjtinha-voo.png" class="absolute -top-16 -right-16 w-auto h-64 transform translate-x-8 z-20"/>

            <img src="${url.resourcesPath}/images/frei-custom.png" class="absolute left-0 -bottom-10 w-96 h-auto">
        </div>

        <div class="lg:hidden absolute top-[26rem] bg-white w-full h-24 rounded-t-[43px] z-10"></div>

        <div class="lg:mt-20 items-center bg-white p-8 rounded-[43px] w-full lg:max-w-md mx-auto relative z-10">
            <div class="flex justify-center hidden lg:flex">
                <img src="${url.resourcesPath}/images/logo-bjconnect-principal.png" alt="BJ Connect" class="h-24 hidden lg:flex">
            </div>

            <h2 class="text-2xl font-semibold text-center text-gray-700 mb-6  lg:mt-10">Esqueceu sua senha?</h2>
            
            <#--  <div class="mb-4"></div>  -->

            <!-- ESQUECI MINHA SENHA -->
            <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    
                    <!-- Label -->
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">
                            E-mail
                        </label>
                    </div>

                    <!-- Mensagem de erro -->
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" dir="ltr"/>
                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                Por favor, informe seu email.
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <!-- Voltar ao login -->
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                        </div>
                    </div>

                    <!-- Botão OK -->
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} mt-10">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </div>
            </form>
            <br>
            Digite o endereço de e-mail e nós lhe enviaremos instruções sobre como criar uma nova senha.
            <!-- ESQUECI MINHA SENHA - FIM -->
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
    </#if>

</@layout.registrationLayout>
