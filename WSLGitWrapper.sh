#!/bin/bash                                                             
# WSL 'git' wrapper, save as /usr/local/bin/git and chmod a+x           
                                                                        
REALPATH=`readlink -f ${PWD}`                                           
ARG1=$1                                                                 
                                                                        
if [  "${REALPATH:0:5}" == "/mnt/" ]; then                              
  if [ $ARG1 == "log" ]; then                                    
    git.exe "$@" --color=always | more                                                 
  else                                                                  
    git.exe "$@"                                                        
  fi                                                                    
else                                                                    
  /usr/bin/git "$@"                                                     
fi                 
