# mindforger.pro     Qt project file for MindForger
#
# Copyright (C) 2016-2018 Martin Dvorak <martin.dvorak@mindforger.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# mindforger.pro     Qt project file for MindForger
#
# Copyright (C) 2016-2018 Martin Dvorak <martin.dvorak@mindforger.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
# mindforger.pro     Qt project file for MindForger
#
# Copyright (C) 2016-2018 Martin Dvorak <martin.dvorak@mindforger.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

#########################################################################
#
# QMake build options:
#   qmake CONFIG+=mfwebengine ... build project w/ Qt webengine instead with Qt webkit
#   qmake CONFIG+=mfnocxx     ... do not define CXX i.e. g++
#   qmake CONFIG+=mfnoccache  ... do not use ccache to build the project
#   qmake CONFIG+=mfdebug     ... show debug messages
#   qmake CONFIG+=mfunits     ... options to run unit tests
#
#########################################################################


TEMPLATE = subdirs

SUBDIRS = deps lib app

# build dependencies
lib.depends = deps
app.depends = lib

# ########################################
# Linux installation: make install
# ########################################
# See http://doc.qt.io/qt-5/qmake-advanced-usage.html

#unix:configfiles.extra = chmod +x data/config/mindforger/scripts/* ; make clean; mv -f mindforger mind
#configfiles.files += data/config/*
#configfiles.path = /usr/share/
#INSTALLS += configfiles

#IMPORTANT: binfile MUST be specified in app/app.pro (project next to/that builds binary)

docfiles.files += doc/*
docfiles.path = /usr/share/doc/mindforger/
INSTALLS += docfiles

manfiles.files += man/*
manfiles.path = /usr/share/man/man1/
INSTALLS += manfiles

iconfiles.files += app/resources/icons/*
iconfiles.path = /usr/share/icons/mindforger/
INSTALLS += iconfiles

# experiment w/ file
shortcutfiles.files += app/resources/gnome-shell/mindforger.desktop
shortcutfiles.path = /usr/share/applications/
INSTALLS += shortcutfiles

# ########################################
# macOS DMG content
# ########################################

macx {
    # ask for APP BUNDLE generation
    CONFIG += app_bundle  # to remove, do CONFIG -= app_bundle

    ICON = app/resources/icons/mindforger.icns

    #macosdocfiles.files = $$PWD/doc/*
    macosdocfiles.files = doc/
    macosdocfiles.path = Contents/Resources
    QMAKE_BUNDLE_DATA += macosdocfiles
}

# eof
