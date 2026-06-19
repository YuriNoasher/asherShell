##################################################
### ALIASSES VER.2.0.0 (YURI NOAH ASHER) [50ch] ##
##################################################

##################################################
#      .@.   @. ,@  @   @   @@@.     .@.
#      @ @   '@_@'  @   @   @ '@.    @ @
#     .@@@,   '@'   @   @   @  :@   .@@@,
#     @' '@    @    @, .@   @ ,@'   @' '@
#     @   @    @    '@@@'   @@@'    @   @
##################################################

# TEMA DE RUBRO
 ## ÁREA DE RUBRO
  ### DEFINICIÓN

##################################################

# PREFERENCIAS DE INICIO
  ### CAMBIA EL ICONO DE LA TERMINAL
 PS1="🌸\e[31m::\e[0m "
  ### IMPRIME UN ASCII ART EN EL INICIO
 printf "%b\n" "$(cat ~/datos/ASCII-art/.i)" | lolcat

##################################################
########### MENSAJES DENTRO DE FUNCIONES #########
##################################################
#               REGLAS DE COLORES
##################################################
# \e[30m # NEGRO    => 
# \e[31m # ROJO     => ERROR | PRECAUCIÓN
# \e[32m # VERDE    => TERMINADO | ÉXITO
# \e[33m # AMARILLO => INFORMACIÓN | SUGERENCIAS
# \e[34m # AZUL     => INFORMACIÓN DE PROCESO TERMINADO
# \e[35m # MAGENTA  => PERSONALIZACIÓN
# \e[36m # CIAN     => INFORMACIÓN DE PROCESO
# \e[37m # BLANCO   => COMANDOS (FONDO NEGRO Y NEGRITA)
##################################################
#                   FONDO
##################################################
# \e[40m # NEGRO    => COMANDOS
# \e[41m # ROJO     => 
# \e[42m # VERDE    => 
# \e[43m # AMARILLO => 
# \e[44m # AZUL     => 
# \e[45m # MAGENTA  => 
# \e[46m # CIAN     => 
# \e[47m # BLANCO   => COMANDOS (COLOR BLANCO Y NEGRITA)
##################################################
#                   BRILLANTE
##################################################
# \e[90m # GRIS     => 
# \e[91m # ROJO     => ERROR | PRECAUCIÓN
# \e[92m # VERDE    => TERMINADO | ÉXITO
# \e[93m # AMARILLO => INFORMACIÓN | SUGERENCIAS
# \e[94m # AZUL     => INFORMACIÓN DE PROCESO TERMINADO
# \e[95m # MAGENTA  => PERSONALIZACIÓN
# \e[96m # CIAN     => INFORMACIÓN DE PROCESO (REINICIO)
# \e[97m # BLANCO   => COMANDOS (FONDO NEGRO Y NEGRITA)
##################################################
#                   EFECTOS
##################################################
# \e[1m # NEGRITA   => 
# \e[2m # TENUE     => 
# \e[4m # SUBRAYADO => 
# \e[5m # PARPADEO  => 
##################################################
###          MENSAJE Y DIALOGOS
##################################################

m_act() {
  if [[ "$1" =~ ^[iI]$ ]]; then
  echo -e "\e[36m INICIANDO ACTUALIZACIÓN ...\e[0m"
  elif [[ "$1" =~ ^[fF]$ ]]; then
  echo -e "\e[32m✅ ACTUALIZACIÓN TERMINADA.\e[0m"
  fi
}

m_edi() {
  tipo=$1
  documento=$2

  if [[ "$tipo" =~ ^[iI]$ ]]; then
    echo -ne "\e[36mSE ABRIRÁ EL DOCUMENTO DE\e[0m ${documento} \e[36mCON nvim...\e[0m \n"
  elif [[ "$tipo" =~ ^[rR]$ ]]; then
    echo -ne "\e[33m¿DESEA RECARGAR? [S/N]: \e[0m \n"
  elif [[ "$tipo" =~ ^[fF]$ ]]; then
    echo -ne "\e[34mlA EDICIÓN DEL DOCUMENTO\e[0m ${documento} \e[34mHA TERMINADO CON ÉXITO.\e[0m \n"
  fi
}



  ### MENSAJE DE CARGA DE RECURSOS
m_sou() {
  if [[ "$1" == "bash" ]]; then
  echo -e "\e[34mSE HA CARGADO EL DOCUMENTO DE BASH.\e[0m"
  elif [[ "$1" == "zsh" ]]; then
  echo -e "\e[34mSE HA CARGADO EL DOCUMENTO DE ZSH.\e[0m"
  elif [[ "$1" == "p10k" ]]; then
  echo -e "\e[34mSE HA CARGADO EL DOCUMENTO DE POWER10K (ZSH).\e[0m"
  else
  echo -e "\e[34mSE HA CARGADO EL DOCUMENTO.\e[0m"
  fi
}



  ### MENSAJE DE REINICIO
m_reinicio() {
  if [[ "$1" == "normal" ]]; then
    echo -e "\e[96mPREPARANDO TODO PARA EL REINICIO ...\e[0m"
  elif [[ "$1" == "apagado" ]]; then
    echo -e "\e[96mPREPARANDO TODO PARA REINICIO CON APAGADO PROGRAMADO ...\e[0m"
  else
    echo -e "\e[96mTERMINANDO REINICIO ...\e[0m"
  fi
}

m_termux() {
  if [[ "$1" =~ ^[iI]$ ]]; then
    echo -e "\e[96mSE HAN CARGADO LOS AJUSTES DE TERMUX.\e[0m"
  elif [[ -z "$1" ]]; then
    echo -e "\e[94mTERMUX SE CERRARÁ EN BREVE ...\e[0m"
  fi
}



  ### LIMPIEZA DE CONSOLA
alias m_clear='echo -e "\e[33m\e[1mPARA LIMPIAR LA CONSOLA PUEDE USAR EL COMANDO => \e[0m\e[37m\e[40m\e[1mcls\e[0m."'



  ### BARRA DE CARGA
barra_carga() {
  total=30
  for ((i=0; i<=total; i++)); do
    porcentaje=$(( i * 100 / total ))

    printf "\r\e[34mProcesando\e[0m ["
    for ((j=0; j<i; j++)); do printf "\e[32m█\e[0m"; done
    for ((j=i; j<total; j++)); do printf " "; done
    printf "] %d%%" "$porcentaje"

    sleep 0.05
  done
  echo -e "\n\e[32m✔ Completado\e[0m"
}

##################################################
### VARIABLES PARA  AGILIZAMIENTO DE FUNCIONES ###
##################################################

# DIRECCIONES DE ARCHIVOS

 ## DOCUMENTOS DE SISTEMA | CONFIG | PERSON...

  ### BASH
d_bash="$HOME/.bashrc"
  ### ZSHEL
d_zsh="$HOME/.zshrc"
  ### ALIAS (DOCUMENTO ACTUAL)
d_ali="$HOME/datos/conf/ali.sh"
  ### TEMA POWER10K
d_p10k="$HOME/.p10k.zsh"
d_pt="$HOME/datos/conf/temas-p10k.sh"
  ### CONFIGURACIÓN DE NEOFETCH
d_neofetch="$HOME/.config/neofetch/config.conf"
  ### ASCII-ART QUE SE MUESTRA AL INICIAR
d_ascii_art="$HOME/datos/ASCII-art/.i"
  ### COLORES DE TERMUX
d_color_termux="$HOME/.termux/colors.properties"
  ### CONTENIDO PREFIJADO AL INICIAR LA TERMINAL
d_prefix="$PREFIX/etc/motd"




 ## DESTINOS (CARPETAS)

  ### CONTENEDOR DE MULTIMEDIA EN TERMUX
d_m_termux="$HOME/datos/m/"
  ### CONTENEDOR DE MULTIMEDIA EN DISPOSITIVO
d_m_dis="$HOME/storage/downloads/termux/"

d_e_dis="$HOME/storage/downloads/termux/export/"

##################################################
##################################################

# ALIAS:

 ## NAVEGACIÓN

  ### Mostrar contenido con archivos ocultos
 alias ll='ls -la'
  ### Volver una carpeta atrás
 alias ..='cd ..'
  ### Volver dos carpetas atrás
 alias ...='cd ../..'
  ### Volver a HOME de Termux
 alias home='cd ~'

  ### Limpiar todos los mensajes de la terminal
 alias cls='clear'
  ### Actualizar todos los paquetes
 alias update='pkg update && pkg upgrade'

  ### ENLISTAR PAQUETES INSTALADOS
 alias pkglist='dpkg --list'



 ## RECARGAR RECURSOS
 
  ### DE BASH
 alias sobash='source ~/.bashrc'
  ### DE ZSH
 alias sozsh='source ~/.zshrc'
  ### DE POWER10K (TEMA DE ZSH)
 alias sop='source ~/.p10k.zsh'

#alias c.p='p10k configure'






# FUNCIONES

 ## ACTUALIZACIÓN Y RECARGA DE CONSOLA

  ### RECARGA LOS RECURSOS SIN REINICIAR LA CONSOLA
reconsole() {
  if [[ -n "$ZSH_VERSION" ]]; then
    source $d_zsh # sozsh
    m_sou zsh
    source $d_p10k # sop
    m_sou p10k
  elif [[ -n "$BASH_VERSION" ]]; then
    source $d_bash # sobash
    m_sou bash
  fi

  if [[ -z "$1" ]]; then
    m_clear
  fi
}




 ## DESPLAZAMIENTOS DE ARCHIVOS

  ### COPIA DESDE ALMACENAMIENTO INTERNO A TERMUX
copycon() {
  mov="$1"
  if [[ "$mov" =~ ^[cC]$ ]]; then
    echo -ne "\e[36mLOS ELEMENTOS SE COPIARÁN EN BREVE...\e[0m \n"
    barra_carga
    cp -r ${d_m_dis}* ${d_m_termux}
    echo -ne "\e[34mLOS ELEMENTOS HAN SIDO COPIADOS.\e[0m \n"
  elif [[ "$mov" =~ ^[mM]$ ]]; then
    echo -ne "\e[36mLOS ELEMENTOS SE MOVERÁN EN BR    EVE...\e[0m \n"
    barra_carga
    mv -r ${d_m_dis} ${d_m_termux}
  elif [[ -z "$mov" ]]; then
    echo -ne "\e[31copycon NECESITA DE UN PARÁMETRO:\e[0m c \e[31mPARA COPIAR O\e[0m m \e[31mPARA MOVER.\e[0m \n"
  fi
}



  ### EXPORTAR CONTENIDO
exp() {
  doc="$1"
  echo -e "\e[36mSE VA A COPIAR EL DOCUMENTO\e[0m $doc \e[36mEN LA CARPETA EXTERNA DE TERMUX"
  if [[ -z "$d_e_dis" ]]; then
    mkdir $d_e_dis
  fi
  cp $doc $d_e_dis
  echo -e "\e[34mEL DOCUMENTO\e[0m $doc \e[34mSE HA COPIADO CORRECTAMENTE\e[0m"
}



 ## VER O MODIFICAR DOCUMENTOS

  ### FUNCIÓN PRINCIPAL PARA EDITAR DOCUMENTOS
 edicion() {
  doc="$1"
  dir="$2"

  m_edi i $doc
  sleep 1s
  nvim $dir
  m_edi r
  read res
  case $res in
    [sS1])
      reconsole nom
    ;;
  esac
  m_edi f $doc
 }



  ### BASH (TERMINAL PRINCIPAL)
e-bash() {
  edicion ".bashrc" $d_bash
}



  ### ZSH
e-zsh() {
  edicion ".zsh" $d_zsh
}



  ### TEMA POWER10K
e-p10k_op() {
#   read res
    case $res in
      [cC])
        echo -ne "\e[35mABRIENDO LA CONFIGURACIÓN DE POWER10K ...\e[0m \n"
	sleep 0.9s
	p10k configure
	sleep 0.9s
        echo -ne "\e[33m¿DESEA AGREGAR LOS COLORES PERSONALIZADOS AL FINAL DEL DOCUMENTO? [S/N]:\e[0m \n"
	read sn
	case $sn in
	  [sS1])
	    barra_carga
	    echo "source $HOME/datos/conf/temas-p10k.sh" >> $d_p10k
	    echo -ne "\e[34mSE HAN AGREGADO LOS OCLORES EXITOSAMENTE.\e[0m \n"
	  ;;
	  [nN0])
	    echo -ne "\e[34mLOS COLORES HAN QUEDADO POR DEFECTO, SI DESEA AGREGAR LOS ESTILOS PERSONALIZADOS AL FINAL DEL DOCUMENTO CARGUE ESTE MENÚ OTRA VEZ CON:\e[0m e-p10k \e[34mO DIRECTAMENTE:\e[0m e-p10k x \n"
          ;;
        esac
      ;;
      [eE])
        echo -ne "\e[36mABRIENDO EL DOCUMENTO DE:\e[0m .p10k.zsh \e[36mCON:\e[0m neovim. \n"
	sleep 0.9s
        nvim $d_p10k
	echo -ne "\e[34mSE HE EDITADO EL DOCUMENTO CON ÉXITO. \e[0m \n"
      ;;
      [xX])
	barra_carga
	grep -qxF \
		"source $HOME/datos/conf/temas-p10k.sh" \
		"$d_p10k" ||
		echo "source $HOME/datos/conf/temas-p10k.sh" >> "$d_p10k"
	echo -ne "\e[34mSE HAN AGREGADO LOS COLORES EXITOSAMENTE. \e[0m \n"
    esac

}

e-p10k() {
  if [[ -z "$1" ]]; then
    echo -ne "\e[33m¿DESEA ABRIR LA CONFIGURACIÓN DE POWER10K O SOLO EDITAR EL DOCUMENTO DE .p10k.zsh?\e[0m \n"
    echo -ne "\e[35mPARA ABRIR LA CONFIGURACIÓN =>\e[0m c \n"
    echo -ne "\e[36mPARA EDITAR EL DOCUMENTO =>\e[0m e \n"
    echo -ne "\e[31mPARA AGREGAR LOS ESTILOS PERSONALIZADOS AL FINAL DEL DOCUMENTO (AL ABRIR LA CONFIGURACIÓN, ESTE PASO APARECE AL FINAL) =>\e[0m x \n"
    read res
    e-p10k_op
    reconsole sip
  else
    res="$1"
    e-p10k_op
    reconsole nop
  fi
}



  ### EDITAR DOCUMENTO DE TEMA PERSONALIZADO P10K
e-tp() {
  edición "temas-p10k.sh" $d_pt
}



  ### DOCUMENTO DE ALIAS (ESTE DOCUMENTO)
e-ali() {
  edicion "ali.sh" $d_ali
}



  ### ASCII-ART DE INICIO
e-ascii() {
  edicion ".i" $d_ascii_art
}



  ### DOCUMENTO DE COLORES DE TERMUX
e-tercol() {
  edicion "colors.properties" $d_color_termux
}



  ### DOCUMENTO DE CONFIGURACIÓN DE NEOFETCH
e-neof() {
  edicion "coonfig.conf" $d_neofetch
}



  ### VER VIDEOS (INEFICIENTE)
#vervi() {
#  doc="$1"
#  res="$2"
#  timg -g ${res}x $doc
#  mpv $doc
#}

   #### Visualizar (BAT)
# alias catbash='bat ~/.bashrc'
   #### Editar (NANO)
# alias nabash='nano ~/.bashrc'

  ### ZSH (SÚPER SHELL)
   #### BAT
# alias batzsh='bat /.zshrc'
   #### NANO
# alias nazsh='nano ~/.zshrc'

  ### DOCUMENTO PRINCIPAL DE ALIAS (ESTE MISMO DOCUMENTO)
   #### BAT
# alias batali='bat ~/datos/conf/ali.sh'
   #### NANO
# alias nali='nano ~/datos/conf/ali.sh'
   #### NEOVIM
# alias nvali='nvim ~/datos/conf/ali.sh'


  ### DOCUMENTO PRINCIPAL DE NEOFETCH
   #### BAT
# alias batneo='bat ~/.config/neofetch/config.conf'
   #### NANO
# alias naneo='nano ~/.config/neofetch/config.conf'

  ### DOCUMENTO PRINCIPAL DEL TEMA POWER10K
   #### BAT
 ## RECARGAR RECURSOS
  ### DE BASH
 alias sobash='source ~/.bashrc'
  ### DE ZSH
 alias sozsh='source ~/.zshrc'
  ### DE POWER10K (TEMA DE ZSH)
 alias sop='source ~/.p10k.zsh'
# alias batp='bat ~/.p10k.zsh'
   #### NANO
# alias nap='nano ~/.p10k.zsh'

### Configuración del paquete Power10k de ZSH
  ### DOCUMENTO CON EL ASCII-ART MOSTRADO AL INICIO
   #### BAT
# alias bati='bat ~/datos/ASCII-art/.i'
   #### NANO
# alias naii='nano ~/datos/ASCII-art/.i'

  ### DOCUMENTO DE PROPIEDADES DE COLOR DE TERMUX
   #### BAT
# alias batercol='nano ~/.termux/colors.properties'
   #### NANO
# alias natercol='nano ~/.termux/colors.properties'

  ### MENSAJE DE INICIO
   #### BAT
# alias batini='bat $PREFIX/etc/motd'
   #### NANO
# alias naini='nano $PREFIX/etc/motd'



# FUNCIONES



 ## VISUALES

  ### CAMBIAR FUENTE 
cambiar_fuente() {
  echo -e "\e[45mLA FUENTE CAMBIARÁ EN BREVE ...\e[0m"
  cp $1 ~/.termux/font.ttf
  reconsole fff
}

  ### ACTUALIZACIÓN DE PAQUETES Y RECARGA DE RECURSOS
dots() {
  if [[ -z "1$" ]]; then
    m_act i
    pkg update && pkg upgrade
    m_act f
  fi

  reconsole no

  if [[ -z "1$" ]]; then
    m_clear
  fi
}

  ### REINICIO DE CONSOLA; RECARGA PAQUETES Y
  ###... CONFIGURACIONES DE TERMUX
reinicio() {

  echo -ne "\e[33m¿DESEA CERRAR TERMUX AL TERMINAR? [S/N]: \e[0m"
  read res
# read -p $'\e[33m¿DESEA CERRAR TERMUX AL TERMINAR? [S/N]: \e[m' res
  case $res in
    [sS1])
      m_reinicio apagado
       sleep 2
      reconsole nyan

      termux-reload-settings
      m_termux i
       sleep 2
      m_reinicio
      m_termux
       sleep 5
      barra_carga
      sleep 2
      kill -TERM -$$
    ;;
    [nN0])
      m_reinicio normal
       sleep 2
      reconsole wow

      termux-reload-settings
      m_termux i
       sleep 2
       exec $SHELL
      echo -ne "\e[33m¿DESEA LIMPIAR TODOS LOS MENSAJES HASTA EL MOMENTO? [S/N]: \e[0m"
      read res
#     read -p $'\e[33m¿DESEA LIMPIAR TODOS LOS MENSAJES HASTA EL MOMENTO? [S/N]: \e[0m' res
      case $res in
        [Ss1])
         clear
        ;;
        [Nn0])
         echo -e "\e[36mABRIENDO neofetch ...\e[0m"
        ;;
      esac
       sleep 3
      neofetch
    ;;
  esac
}

 ## NAVEGACIÓN

  ### NAVEGAR Y VISUALIZAR
s() {
  if [ "$1" = "-" ]; then
    cd - || return
  else
    cd "$1" || return
  fi
  ls -a
}

 ## RESPALDO

  ### RESPALDO DE COLORES DE TERMUX
rester() {
# fecha=$(date +"%y-%m-%d_%H-%M-%S")
  destino="$HOME/datos/backup/col/termux/color_properties/tema_$1"

  mkdir -p "$destino"

  echo "Creando tema de Termux y respaldando en backup..." 

  [ -f "$HOME/.termux/colors.properties" ] && cp "$HOME/.termux/colors.properties" "$destino/"
}

  ### RESPALDO DE CONFIGURACIÓN
backup() {
  fecha=$(date +"%y-%m-%d_%H-%M-%S")
  destino="$HOME/backups/config_$fecha"

  mkdir -p "$destino"

  echo "📦 Creando snapshot en: $destino"

  # Archivos principales
  [ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$destino/"
  [ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$destino/"
  [ -f "$HOME/datos/conf/ali.sh" ] && cp "$HOME/datos/conf/ali.sh" "$destino/"

  # Carpetas importantes
  [ -d "$HOME/.config" ] && cp -r "$HOME/.config" "$destino/"
  [ -d "$HOME/.termux" ] && cp -r "$HOME/.termux" "$destino/"

  echo "✅ Snapshot completado"
}

  ### RESPALDO DE CONFIGURACIÓN EN COMPRIMIDO (TAR.GZ)
backupZ() {
  fecha=$(date +"%y-%m-%d_%H-%M-%S")
  base="$HOME/backups"
  carpeta="$base/config_$fecha"

  mkdir -p "$carpeta"

  cp "$HOME/.zshrc" "$carpeta/" 2>/dev/null
  cp "$HOME/.bashrc" "$carpeta/" 2>/dev/null
  cp "$HOME/datos/conf/ali.sh" "$carpeta/" 2>/dev/null
  cp -r "$HOME/.config" "$carpeta/" 2>/dev/null
  cp -r "$HOME/.termux" "$carpeta/" 2>/dev/null

  tar -czf "$carpeta.tar.gz" -C "$base" "config_$fecha"
  rm -rf "$carpeta"

  echo "📦 Backup comprimido: $carpeta.tar.gz"
}

  ### RESTABLECER CONFIGURACIÓN DESDE UNA FECHA
confres() {
  #fecha => AA-MM-DD_hh-mm-ss
  tar -xzf config_$1.tar.gz
}









 ## PRUEBAS ...

pedir_edad() {
  read "edad?Edad: "

  if [[ $edad =~ ^[0-9]+$ ]]; then
    echo "Tienes $edad años"
  else
    echo "Eso no es un número 😅"
  fi
}

#shocol() {
#  for i in {0..255}; do
#    print -Pn "%K{$i}  $i  %k"
#    (( (i + 1) % 16 )) || print
#  done
#}

shocol() {
  if [ -n "$ZSH_VERSION" ]; then
    for i in {0..255}; do
      print -Pn "%K{$i}  $i  %k"
      (( (i + 1) % 16 )) || print
    done
  else
    for i in $(seq 0 255); do
      printf "\e[48;5;%sm %3s \e[0m" "$i" "$i"
      (( (i + 1) % 16 == 0 )) && printf "\n"
    done
  fi
}

##############################################
####### INICIO INTELIGENTE (BY: YURI) ########
##############################################

# INESTABLE (ERROR DESCONOCIDO Y PERSISTENTE CON GIT)
ii() {
  echo -e "\e[90m\e[47m===================== EJECUTANDO INICIO ==================\e[0m"
  echo -e "ESPECIFIQUE EL TIPO DE SESIÓN ENTRE LAS DISPONIBLES:"
  echo -e "\e[45m\e[30m=> S \e[0m\e[47m🌸\e[0m\e[45m \e[30mMI ESPACIO                                        \e[0m"
  echo -e "\e[44m\e[30m=> E \e[0m\e[47m🔍\e[0m\e[44m \e[30mEXPLORACIÓN                                       \e[0m"
  echo -e "\e[46m\e[30m=> R \e[0m\e[47m🌙\e[0m\e[46m \e[30mRELAJACIÓN                                        \e[0m"
  echo -e "\e[43m\e[30m=> * \e[0m\e[47m🌟\e[0m\e[43m \e[30mINICIO RÁPIDO (PRESIONA ENTER O CUALQUIER TECLA)  \e[0m"

  read -p "=> " opcion

  case $opcion in
  [Ss])
    echo "INICIANDO MI ESPACIO..."
    barra_carga
#   cls
    export MODO_ZSH="ms"
    exec zsh
    neofetch
    PS1="🌈 "
    ;;
  [Ee])
    echo "INICIANDO EXPLORACIÓN..."
    barra_carga
    export MODO_ZSH="ex"
    echo "COMANDOS..."
    exec zsh
#   PS1="()=>> "
    ;;
  [Rr])
    echo "INICIANDO RELAJACIÓN..."
#    barra_carga
    export MODO_ZSH="re"
#    cls
    exec zsh
    ;;
  *) 
    neofetch
