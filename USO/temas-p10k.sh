##
## TEMA PARA POWER10K
##

  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='🌸 yuri'
 ## ICONO PERSONALIZADO (ICONO PRINCIPAL)


 ## COLORES SEGÚN LA CONFIGURACIÓN DE TERMUX

  ### OS_ICON => ICONO PRINCIPAL
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=5 # 9

  ### DIR => DIRECCIÓN EN EL DISCO
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=9 # 5
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=254

  ### ESTATUS OK
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
  typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=0
  ### ESTATUS ERROR
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=0
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=7

  ### RAM => DATOS DE RAM
  typeset -g POWERLEVEL9K_RAM_FOREGROUND=0
  typeset -g POWERLEVEL9K_RAM_BACKGROUND=3

 ## DISK_USAGE
  ### ESPACIO MORMAL
  typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=3
  typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND=0
  ### POCO ESPACIO
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=0
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND=3
  ### NULO ESPACIO
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=7
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND=1

  ### DIP => DIRECCIÓN  IP PÚBLICA
  typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=7
  typeset -g POWERLEVEL9K_PUBLIC_IP_BACKGROUND=0

 ## CARACTERES EN MULTILINEA
  ### IZQUIERDA
   #### PRIMER ╭─
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%244F╭─'
  #### INTERMEDIOS (CADA LÍNEA NUEVA)
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%244F├─'
   #### FINAL
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%244F╰─'




   #### SEPARADOR INTERNO IZQUIERDO
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'

   #### SEPARADOR INTERNO DERECHO
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'

   #### SEPARADOR EXTERNO IZQUIERDO
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'

   #### SEPARADOR EXTERNO DERECHO
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'


#  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'                                 1   
  # The left end of right prompt.
#  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'                             3   
  # The left end of left prompt.
#  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''                              
  # The right end of right prompt.
#  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''                                
  # Left prompt terminator for lines without any s     egments.
#  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=







  ### SALUDO
#  typeset -g POWERLEVEL9K_SALUDO_FOREGROUND=0
#  typeset -g POWERLEVEL9K_SALUDO_BACKGROUND=1

  ### ICONO
  prompt_yuri() {
    p10k segment \
    -i '🌈' \
    -b '%k'
  }

  ### MODO
  prompt_modo() {
    case "$PWD" in
      */conf*)
        p10k segment \
        -i '⚙️' \
        -b '7' \
        -f '0' \
        -t 'Configurando >'
      ;;
      */datos/m*)
        p10k segment \
        -i '👾' \
        -b '0' \
        -f '5' \
        -t 'Jugando:'
      ;;
      */storage*)
        p10k segment \
        -i '📲' \
        -b '7' \
        -f '0' \
        -t 'Android >>'
      ;;
      *)
      p10k segment \
        -i '🌈' \
        -b '4' \
        -f '0' \
        -t ':'
      ;;
    esac
}

  prompt_saludo() {
    local hora=$(date +%H)

    ##### 07 - 08
    if (( hora >= 6 && hora <= 11 )); then
      p10k segment \
      -i '🌅' \
      -t 'Buenos días' \
      -f '0' \
      -b '3'
      return
    fi

    ##### 12 - 19
    if (( hora >= 12 && hora <= 19 )); then
      p10k segment \
      -i '🌄' \
      -t 'Buenas tardes' \
      -f '3' \
      -b '0'
      return
    fi

    ##### 20 - 22
    if (( hora >= 20 )); then
      p10k segment \
      -i '🌝' \
      -t 'Buenas noches' \
      -f '3' \
      -b '0'
      return
    fi

    ##### 00 - 07
    if (( hora < 6 )); then
      p10k segment \
      -i '🌌' \
      -t 'Media noche' \
      -f '4' \
      -b '0'
      return
    fi
  }




  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
# LINEA 1     

 ## ICONO IDENTIFICADOR
saludo
os_icon

# LINEA 2

 ## GENERA EL SALTO DE LINEA
newline
dir

# LINEA 3

 ## L3
newline
modo

# LINEA 4

 ## L4
# newline

)


  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
# LINEA 1

status                  
command_execution_time  
# background_jobs         
# direnv                  
# asdf                    
# virtualenv              
# anaconda               
# pyenv                   
# goenv                   
# nodenv                  
# nvm                    
# nodeenv                 
# rbenv                   
# rvm                     
# fvm                     
# luaenv
# jenv                    
# plenv                   
# perlbrew                
# phpenv                  
# scalaenv                
# haskell_stack           
# kubecontext             
# terraform               
# aws                     
# aws_eb_env              
# azure                   
# gcloud                  
# google_app_cred         
# context                 
# nordvpn                 
# ranger
# yazi                    
# nnn                     
# lf                      
# xplr
# vim_shell               
# midnight_commander      
# nix_shell               
# chezmoi_shell           
# vi_mode                 
# # prompt_char                         
# todo                    
# timewarrior             
# taskwarrior             
# per_directory_history   

time

# L-2
newline

# L-3

  )

