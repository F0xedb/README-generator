#!/bin/bash

# A small test script to verify if everything still works

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color



function generate-files {
        cat <<EOF > test-theme
repo
org_name
usr_name
usr_email
title
desc_var
doc_var
license_var
image_url
width_img
height_img
EOF
        cat <<EOF > result
tos-live
F0xedb
F0xedb
tom@pbfp.team
tos live
A small operating system based on arch
https://tos.pbfp.xyz/blog
GPL
https://tos.pbfp.xyz/images/logo.svg
150
200
EOF
        cat <<EOF > config.conf
#!/bin/bash
theme="test-theme"

repo="tos-live" # this will autofill to https://www.github.com/F0xedb/tos-live inside the readme template
org_name="F0xedb"
usr_name="F0xedb"
usr_email="tom@pbfp.team"

title="a title"
desc="A small operating system based on arch"

doc="https://tos.pbfp.xyz/blog"

license="GPL"

image_url="https://tos.pbfp.xyz/images/logo.svg"
width="150" 
height="200"
            
EOF
}

function test-commands {
        themes=$(sh ../readme-gen -l) 
        if [[ "$themes" == "$(ls /var/cache/readme && ls $HOME/.cache/readme)" ]]; then
                printf "${GREEN}PASS${NC}: all themes are correctly listed\n" 
        else
                printf "${RED}${RED}ERROR${NC}${NC}: the theme files don't match\n"
                exit 1
        fi
        generate-files

        sh ../readme-gen -a test-theme 

        if [[ "$(sh ../readme-gen -l)" == *test-theme* ]]; then
                printf "${GREEN}PASS${NC}: theme added\n"
                rm $HOME/.cache/readme/test-theme
        else
                printf "${RED}ERROR${NC}: The requested theme isn't added\n"
                echo $(sh ../readme-gen -l)
                printf "Expected test-them\n"
                exit 1
        fi

        exit 0
}

function test-output {
        generate-files
        chmod +x config.conf
        
        sh readme-gen -a test-theme

        sh readme-gen -c ../md.conf
        readme=$(cat README.md)
        if [[ "$readme" == "$(cat result)" ]]; then
                printf "${GREEN}PASS${NC}: generated readme is correct\n"
        else
                printf "${RED}ERROR${NC}: generated readme is wrong\n"
                printf "GENERATED RESULT\n"
                printf "$readme\n"
                printf "EXPECTED README\n"
                printf "$(cat result)\n"
                exit 1
        fi

        rm $HOME/.cache/readme/test-theme
        exit 0
}

function test-readme {
        generate-files
        sh ../readme-gen -a test-theme
        sh ../readme-gen -c ../md.conf
        if [[ -f "README.md" ]]; then
                printf "${GREEN}PASS${NC}: README created\n"
        else
                printf "${RED}ERROR${NC}: README failed\n"
                exit 1
        fi
        sh ../readme-gen -c ../md.conf
        if [[ -f "README_old.md" ]]; then
               printf "${GREEN}PASS${NC}: Saved README \n"
        else
               printf "${RED}ERROR${NC}: README didn't backup\n"
               exit 1
        fi 
        rm $HOME/.cache/readme/test-theme
        exit 0
}

if [[ -d "test" ]]; then
        rm -rf test
fi
mkdir test
cd test
cp ../readme-gen .

case "$1" in 
    "-c")
            printf "Testing commands\n"
            test-commands
    ;;
    "-o")
        printf "Testing output\n"
        test-output
    ;;
    "-r")
        printf "Testing readme\n"
        test-readme
    ;;
esac
