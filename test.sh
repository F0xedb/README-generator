#!/bin/bash

# A small test script to verify if everything still works

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
        if [[ "$themes" == "$(/usr/bin/ls /var/cache/readme && /usr/bin/ls $HOME/.cache/readme)" ]]; then
                echo "PASS: all themes are correctly listed" 
        else
                echo "ERROR: the theme files don't match"
                exit 1
        fi
        generate-files

        sh ../readme-gen -a test-theme 

        if [[ "$(sh ../readme-gen -l)" == *test-theme* ]]; then
                echo "PASS: theme added"
                rm $HOME/.cache/readme/test-theme
        else
                echo "ERROR: The requested theme isn't added"
                echo $(sh ../readme-gen -l)
                echo "Expected test-them"
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
                echo "PASS: generated readme is correct"
        else
                echo "ERROR: generated readme is wrong"
                echo "GENERATED RESULT"
                echo "$readme"
                echo "EXPECTED README"
                echo "$(cat result)"
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
                echo "PASS: README created"
        else
                echo "ERROR: README failed"
                exit 1
        fi
        sh ../readme-gen -c ../md.conf
        if [[ -f "README_old.md" ]]; then
               echo "PASS: Saved README "
        else
               echo "ERROR: README didn't backup"
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
            echo "Testing commands"
            test-commands
    ;;
    "-o")
        echo "Testing output"
        test-output
    ;;
    "-r")
        echo "Testing readme"
        test-readme
    ;;
esac
