#!/bin/bash
# asherShell > INSTALADOR



## VARIABLES DE DOCUMENTO
VER=0.1.0
## VARIABLE DE EJECUCION
OS="NO_VERIFICADO"
## VARIABLES DE ESTADO DE INSTALACIÓN
BASH="noin"
ASHERALI="noin"
ZSH="noin"
P10K="noin"
ASHERP10K="noin"
ASCII="noin"
NEOVIM="noin"
TERCOL="NO_VERIFICADO"



## CARGA DE DOCUMENTO DE DATOS (NODOC.sh) CONTIENE:
## -> s__ALI
## -> s__P10K
## -> s__NEOVIM 
source /USO/NODOC.sh



## DIRECTORIO PRINCIPAL DE asherShell
FINAL="$HOME/.asherShell"

## BASH
# d_BASH="USO/.bashrc" # UBICACIÓN EN INSTALADOR
u_BASH="$HOME/.bashrc" # UBICACIÓN FINAL

# ALI
d_ASHERALI="USO/ali.sh" # I
u_ASHERALI="$FINAL/ali.sh" # F

### ZSH
# d_ZSH="USO/.zshrc" # I
u_ZSH="$HOME/.zshrc" # F

### P10K
# d_P10K="USO/.p10k.zsh"
# r_P10K="$HOME/"
u_P10K="$HOME/.p10k.zsh"

### TEMA PERSONALIZADO DE POWERLEVEL10K
d_ASHERP10K="USO/temas-p10k.sh"
u_ASHERP10K="$FINAL/temas-p10k.sh"

### ASCII ART
d_ASCII="USO/.i"
u_ASCII="$FINAL/.i"

### NEOVIM
# d_NEOVIM="USO/init.lua"
r_NEOVIM="$HOME/.config/nvim"
u_NEOVIM="$r_NEOVIM/init.lua"

### CONFIGURACIÓN DE COLORES DE TERMUX
d_TERCOL="USO/colors.properties"
r_TERCOL="$HOME/.termux"
u_TERCOL="$r_TERCOL/colors.properties"



# FUNCIONES PRINCIPALES DE INFORMACIÓN O DIALOGO
## INFORMAR
informar() {
    tipo="$1"
    mensaje="$2"

    case $1 in
        error)
            echo -e "\e[31m$2\e[0m"
        ;;
        exito)
            echo -e "\e[32m$2\e[0m"
        ;;
        sugerencia)
            echo -e "\e[33m$2\e[0m"
        ;;
        terminado)
            echo -e "\e[34m$2\e[0m"
        ;;
        estilo)
            echo -e "\e[35m$2\e[0m"
        ;;
        progreso)
            echo -e "\e[36m$2\e[0m"
        ;;
        i)
            echo -e "\e[37m$2\e[0m"
        ;;
        I)
            echo -e "\e[47m\e[33m$2\e[0m"
        ;;
    esac
}



verificar() {
    case "$1" in
    os)
        if [[ -n "$TERMUX_VERSION" ]]; then
            OS="termux"
            informar terminado "SE HA DETECTADO: TERMUX"
        else
            OS="linux"
            informar terminado "SE HA DETECTADO: LINUX"
        fi
    ;;
    variable)
        if [[ -n "$2" ]]; then
            return
        fi
    ;;
    existe)
    if [[ -e "$2" ]]; then
            informar exito "EXISTE $2"
            return
        else
            informar progreso "NO EXISTE $2"
            return
    fi
    ;;

    # instalacion)
    # ;;

    esac
}



# verINS() {
#     variable="$1"
#     direccion="$2"
#     informar="$3"

#     if verificar existe "$direccion"; then
#         $variable="instalado" # ERROR
#         if [[ "$informar" == "true" ]]; then
#             informar exito "SE HA INSTALADO CON ÉXITO EN LA DIRECCIÓN: $direccion"
#         fi
#     else
#         $variable="error_de_instalacion" # ERROR
#         if [[ "$informar" == "true" ]]; then
#             informar error "NO SE HA PODIDO INSTALAR $variable EN $direccion"
#         fi
#     fi
# }



## REMPLAZO
reemplazar() {
    contenido="$1"
    destino="$2"

    printf "" > "$destino"
}



## ANEXO DE CONTENIDO
anexar() {
    contenido="$1"
    destino="$2"

    printf "$contenido" >> "$destino"
}



## IMPRIMIR
imprimir() {
    anexar "VERSION=$VER\nENTORNO=$OS\nBASH=$BASH\nASHERALI=$ASHERALI\nZSH=$ZSH\nTEMA_POWERLEVEL10K=$P10K\nASHERP10K=$ASHERP10K\nASCII-ART=$ASCII\nNEOVIM=$NEOVIM" "$1"
    if veerificar os; then
        anexar "COLORES_DE_TERMUX=$TERCOL" "$1"
    fi
}



## CREAR DOCUMENTO O DIRECTORIO
crear() {
    case $1 in
        dir)
            mkdir "$2"
        ;;
        doc)
            touch "$2"
        ;;
    esac
}



# CONFIGURACIÓN Y SU ADMINISTRACIÓN
## MODIFICAR EL DOCUMENTO DE CONFIGURACIÓN
configuracion() {  
    case "$1" in
        nueva)
            if [[ ! -d ".asherShell" ]]; then
                crear dir ".asherShell"
                informar terminado 'La carpeta asherShell fue creada.'
            fi
            crear doc "$HOME/.asherShell/.config"
            imprimir "$HOME/.asherShell/.config"
            informar terminado 'El documento config fue creado en la carpeta existente.'
        ;;
        rehacer)
            reemplazar "CONFIGURACIÓN REESCRITA\n\n" "$HOME/.asherShell/.config"
            imprimir "$HOME/.asherShell/.config"
        ;;
    esac
}



















iniciar() {
    # VERIFICAR OS
    if veerificar os; then
        cp "$d_TERCOL" "$u_TERCOL"
        informar exito "SE HA CONFIRMADO QUE EL ENTORNO ES: TERMUX."
        informar terminado "SE HA COPIADO EL DOCUMENTO DE PROPIEDADES DE COLOR CON ÉXITO."
    fi
    
    # VERIFICAR EXISTENCIA DEL DIRECTORIO .asherShell
    if !verificar existe "$FINAL/"; then 
        crear dir "$FINAL/"
    fi

    # => DOCUMENTO ali.sh
    if verificar existe "$u_ASHERALI"; then
        rm "$u_ASHERALI"
    fi
    cp "$d_ASHERALI" "$FINAL"
    ASHERALI="instalado"
    informar exito "SE HA COPIADO EL DOCUMENTO DE ali.sh CON ÉXITO."

    anexar "$s__ALI" "$u_BASH"
    BASH="instalado"
    informar exito "SE HA CONECTADO CON ÉXITO .bashrc A ali.sh"

    # => DOCUMENTO .i (ASCII-ART)
    cp "$d_ASCII" "$FINAL/"
    ASCII="instalado"
    informar exito "SE HA COPIADO EL ASCII ART CON ÉXITO."

    if !verificar existe "$u_ZSH"; then
        informar sugerencia "NO SE HA INSTALADO 'OH MY ZSH' Y SE ESTÁ INTENTANDO INSTALAR EL DOCUMENTO DE CONFIGURACIÓN."
        informar sugerencia "c <- PARA IGNORAR Y CONTINUAR."
        informar sugerencia "i <- PARA INTENTAR INSTALAR POR ESTE MEDIO."
        read $res
        case "$res" in
        [cC])
            informar progreso "SE CONTINÚA CON LA INSTALACIÓN"
            ZSH="cancelado"
        ;;
        [iI])
            informar progreso "SE VA A EJECUTAR EL INSTALADOR A LA BREVEDAD"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        ;;
        esac
    fi

    if verificar existe "$u_ZSHc"; then
        anexar "$s__ALI" "$u_ZSH"
        ZSH="instalado"
        informar exito "SE HA CONECTADO CON ÉXITO .zsh A ali.sh"
    else
        ZSH="error_de_instalacion"
        informar error "NO SE HA PODIDO CONFIRMAR LA INSTALACIÓN DEL PAQUETE zsh, NECESARIO PARA LA ANEXIÓN DE .zsh AL DOCUMENTO ali.sh"
    fi 

    if [[ "$ZSH" == "instalado" ]]; then
        if !verificar existe "$u_P10K"; then
            informar sugerencia "NO SE HA INSTALADO EL TEMA DE POWERLEVEL10K Y SE ESTÁ INTENTANDO ANEXAR EL DOCUMENTO DE TEMA PERSONALIZADO."
            informar sugerencia "c <- PARA IGNORAR Y CONTINUAR."
            informar sugerencia "i <- PARA INTENTAR INSTALAR POR ESTE MEDIO."
            read $res
            case "$res" in
                [cC])
                    informar progreso "SE CONTINÚA CON LA INSTALACIÓN"
                    P10K="cancelado"
                ;;
                [iI])
                    informar progreso "SE VA A CLONAR EL REPOSITORIO DE GITHUB A LA BREVEDAD"
                    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
                ;;
            esac
        fi

    fi

    cp "$d_ASHERP10K" "$FINAL/"
    ASHERP10K="instalado"
    informar exito "SE HA COPIADO EL DOCUMENTO DE TEMA PERSONALIZADO PARA POWERLEVEL10K CON ÉXITO."

    if verificar existe "$u_P10K"; then
        anexar "$s__P10K" "$u_P10K"
        P10K="instalado"
        informar exito "SE HA CONECTADO CON ÉXITO .p10k.zsh CON temas-p10k.sh"
    else
        P10K="error_de_instalacion"
        informar error "NO SE HA PODIDO CONFIRMAR LA INSTALACIÓN DEL TEMA POWERLEVEL10K, NECESARIO PARA LA ANEXIÓN DEL DOCUMENTO DE TEMA PERSONALIZADO temas-p10k.sh"
    fi

    if command -v nvim &> /dev/null; then
    else
        informar sugerencia "NO SE HA INSTALADO NEOVIM Y SE ESTÁ INTENTANDO AGREGAR CONFIGURACIONES AL DOCUMENTO init.lua"
        informar sugerencia "c <- PARA IGNORAR Y CONTINUAR."
        informar sugerencia "i <- PARA INTENTAR INSTALAR POR ESTE MEDIO."
        read $res
        case "$res" in
            [cC])
                informar progreso "SE CONTINÚA CON LA INSTALACIÓN"
                NEOVIM="cancelado"
            ;;
            [iI])
                informar progreso "SE VA A CLONAR EL REPOSITORIO DE GITHUB A LA BREVEDAD"
                git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            ;;
        esac
    fi

    if command -v nvim &> /dev/null; then
        if !verificar existe "$r_NEOVIM/"; then
            crear dir "$r_NEOVIM/"
        fi

        anexar "$s__NEOVIM" "$u_NEOVIM"
        NEOVIM="instalado"
        informar exito "SE HA AÑADIDO LA CONFIGURACIÓN EN init.lua CON ÉXITO."
    else
        NEOVIM="error_de_instalacion"
        informar error "NO SE HA PODIDO CONFIRMAR LA INSTALACIÓN DE NEOVIM, NECESARIO PARA LA ADICIÓN DE LA CONFIGURACIÓN AL DOCUMENTO DE init.lua"
    fi

    configuracion nueva
}