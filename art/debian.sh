#! /bin/sh
# Configure your paths and filenames
SOURCEBINPATH=.
SOURCEBIN=lair
SOURCEBINDEX=lair-index-resources
SOURCEDOC=README.md
SRCFOLDER=valair-data
DEBFOLDER=valair-data
DEBVERSION=$(date +%Y%m%d)

if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi
cd $TOME

git pull origin master

DEBFOLDERNAME="$TOME/../$DEBFOLDER-$DEBVERSION"

# Create your scripts source dir
mkdir $DEBFOLDERNAME

# Copy your script to the source dir
cp $TOME $DEBFOLDERNAME -R
cd $DEBFOLDERNAME

# Create the packaging skeleton (debian/*)
dh_make -s --createorig

mkdir -p debian/tmp
cp -R bin share debian/tmp

# Remove make calls
grep -v makefile debian/rules > debian/rules.new
mv debian/rules.new debian/rules

# debian/install must contain the list of scripts to install
# as well as the target directory
echo bin/$SOURCEBIN usr/bin >> debian/install
echo bin/$SOURCEBINDEX usr/bin >> debian/install
echo $SOURCEDOC usr/share/doc/$DEBFOLDER >> debian/install
for d in share/lair/*; do
    if [ -d $d ]; then
        for e in $d/*; do
            if [ -d $e ]; then
                for f in $e/*; do
		    if [ -d $f ]; then
		        for g in $f/*; do
                            echo $g usr/$f >> debian/install
                        done
		    else
                        echo $f usr/$e >> debian/install
		    fi
                done
            else
                echo $e usr/$d >> debian/install
            fi
        done
    else
        echo $d usr/share/lair >> debian/install
    fi
done

# Remove the example files
rm debian/*.ex

#dpkg-source --commit

# Build the package.
# You  will get a lot of warnings and ../somescripts_0.1-1_i386.deb
debuild -us -uc > ../log
