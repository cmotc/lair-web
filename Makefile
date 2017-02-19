
export PROJECT_PATH:= ${HOME}/Projects
export WEB_PATH := ${PROJECT_PATH}/lair-web
export BLOG_PATH := ${WEB_PATH}/blog
export SOURCECODE_PATH := ${PROJECT_PATH}/valair
export ARTWORK_PATH := ${PROJECT_PATH}/lairart
export WINPACKAGES_PATH := ${PROJECT_PATH}/lair-msi
export DEBREPO_PATH := ${PROJECT_PATH}/lair-deb

export DOCTYPE := "<!DOCTYPE html>"
export HTML := "<html>"
export TITLE := "LAIR!"
export H1 := "<head>"
export H2 := "<meta charset="utf-8">"
export H3 := "<title>${TITLE}</title>"
export H4 := "<link rel=\"stylesheet\" href=\"style.css\">"
export H4B := "<link rel=\"stylesheet\" href=\"../style.css\">"
export H5 := "<script src=\"script.js\"></script>"
export H6 := "</head>"

export N0 := '  * [home](index.html)'
export N1 := '  * [info](info.html)'
export N2 := '  * [maps](maps.html)'
export N3 := '  * [ai](mobs.html)'
export N4 := '  * [license](license.html)'
export N5 := '  * [art](art/art.html)'
export N6 := '  * [blog](blog/blog.html)'

export N0B := '  * [home](../index.html)'
export N1B := '  * [info](../info.html)'
export N2B := '  * [maps](../maps.html)'
export N3B := '  * [ai](../mobs.html)'
export N4B := '  * [license](../license.html)'
export N5B := '  * [art](../art/art.html)'
export N6B := '  * [blog](../blog/blog.html)'

export D1 := '  * [windows](windows.html)'
export D2 := '  * [debian](lair-deb/index.html)'

webpage:
	make head
	make head2
	make nav
	make nav2
	cd ${WEB_PATH} && markdown README.md > ${WEB_PATH}/index.html.tmp
	cp ${SOURCECODE_PATH}/image.gif ${WEB_PATH}/image.gif
	cd ${WEB_PATH} && echo "![gif_image](image.gif)" | markdown >> ${WEB_PATH}/index.html.tmp
	cat ${WEB_PATH}/head.html ${WEB_PATH}/index.html.tmp > ${WEB_PATH}/index.html
	cd ${SOURCECODE_PATH} && markdown README.md  > ${WEB_PATH}/info.html.tmp
	cat ${WEB_PATH}/head.html ${WEB_PATH}/nav.html ${WEB_PATH}/info.html.tmp > ${WEB_PATH}/info.html
	cd ${SOURCECODE_PATH} && markdown LUA.md     > ${WEB_PATH}/maps.html.tmp
	cat ${WEB_PATH}/head.html ${WEB_PATH}/nav.html ${WEB_PATH}/maps.html.tmp > ${WEB_PATH}/maps.html
	cd ${SOURCECODE_PATH} && markdown LUA_MOB.md > ${WEB_PATH}/mobs.html.tmp
	cat ${WEB_PATH}/head.html ${WEB_PATH}/nav.html ${WEB_PATH}/mobs.html.tmp > ${WEB_PATH}/mobs.html
	cd ${SOURCECODE_PATH} && markdown COPYING.md > ${WEB_PATH}/license.html.tmp
	cat ${WEB_PATH}/head.html ${WEB_PATH}/nav.html ${WEB_PATH}/license.html.tmp > ${WEB_PATH}/license.html
	rm -rf ${WEB_PATH}/art
	cp -Rv ${ARTWORK_PATH} ${WEB_PATH}/art
	cp -Rv ${WEB_PATH}/art/index.html ${WEB_PATH}/art/art.html
	rm -rf ${WEB_PATH}/art/.git
	cd ${WINPACKAGES_PATH} && markdown README.md > ${WEB_PATH}/windows.html.tmp
	cat ${WEB_PATH}/head.html ${WEB_PATH}/nav.html ${WEB_PATH}/windows.html.tmp > ${WEB_PATH}/windows.html
	rm -rf ${WEB_PATH}/lair-deb
	cp -Rv ${DEBREPO_PATH} ${WEB_PATH}/lair-deb
	rm -rf ${WEB_PATH}/lair-deb/.git
	make blogtool
	make dustup

head:
	echo ${DOCTYPE} > head.html
	echo ${HTML} >> head.html
	echo ${H1} >> head.html
	echo ${H2} >> head.html
	echo ${H3} >> head.html
	echo ${H4} >> head.html
	echo ${H5} >> head.html
	echo ${H6} >> head.html

head2:
	echo ${DOCTYPE} > head2.html
	echo ${HTML} >> head2.html
	echo ${H1} >> head2.html
	echo ${H2} >> head2.html
	echo ${H3} >> head2.html
	echo ${H4B} >> head2.html
	echo ${H5} >> head2.html
	echo ${H6} >> head2.html

nav:
	echo ${N0} | markdown > nav.html
	echo ${N1} | markdown >> nav.html
	echo ${N2} | markdown >> nav.html
	echo ${N3} | markdown >> nav.html
	echo ${N4} | markdown >> nav.html
	echo ${N5} | markdown >> nav.html
	echo ${N6} | markdown >> nav.html

nav2:
	echo ${N0B} | markdown > nav2.html
	echo ${N1B} | markdown >> nav2.html
	echo ${N2B} | markdown >> nav2.html
	echo ${N3B} | markdown >> nav2.html
	echo ${N4B} | markdown >> nav2.html
	echo ${N5B} | markdown >> nav2.html
	echo ${N6B} | markdown >> nav2.html

dl:
	echo ${N1} | markdown > nav.html
	echo ${N2} | markdown >> nav.html

blogtool:
	markdown ${WEB_PATH}/blog/blog.md > ${WEB_PATH}/blog/blog.html.tmp
	cat ${WEB_PATH}/head2.html ${WEB_PATH}/nav2.html ${WEB_PATH}/blog/blog.html.tmp > ${WEB_PATH}/blog/blog.html

dustup:
	rm ${WEB_PATH}/head.html
	rm ${WEB_PATH}/head2.html
	rm ${WEB_PATH}/nav.html
	rm ${WEB_PATH}/*.html.tmp
