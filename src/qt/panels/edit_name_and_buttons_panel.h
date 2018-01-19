/*
 edit_name_and_buttons_panel.h     MindForger thinking notebook

 Copyright (C) 2016-2018 Martin Dvorak <martin.dvorak@mindforger.com>

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
#ifndef M8R_EDIT_NAME_AND_BUTTONS_PANEL_H
#define M8R_EDIT_NAME_AND_BUTTONS_PANEL_H

#include <QtWidgets>

#include "../dialogs/note_edit_dialog.h"

namespace m8r {

class EditTitleAndButtonsPanel : public QWidget
{
    Q_OBJECT

private:
    QHBoxLayout* layout;
    QLabel* label;
    QLineEdit* lineEdit;
    QPushButton* moreButton;
    QPushButton* rememberButton;
    QPushButton* cancelButton;

    NoteEditDialog* noteEditDialog;

public:
    explicit EditTitleAndButtonsPanel(QWidget* parent);
    EditTitleAndButtonsPanel(const EditTitleAndButtonsPanel&) = delete;
    EditTitleAndButtonsPanel(const EditTitleAndButtonsPanel&&) = delete;
    EditTitleAndButtonsPanel &operator=(const EditTitleAndButtonsPanel&) = delete;
    EditTitleAndButtonsPanel &operator=(const EditTitleAndButtonsPanel&&) = delete;
    ~EditTitleAndButtonsPanel();

    void setNoteEditDialog(NoteEditDialog* noteEditDialog) { this->noteEditDialog = noteEditDialog; }
    void setCurrentNote(Note* note) {
        noteEditDialog->setCurrentNote(note);
        lineEdit->setText(QString::fromStdString(note->getTitle()));
    }

    QString getTitle(void) const { return lineEdit->text(); }
    QPushButton* getRememberButton(void) const { return rememberButton; }
    QPushButton* getCancelButton(void) const { return cancelButton; }

private slots:
    void slotNoteEditDialog(void);
};

}
#endif // M8R_EDIT_NAME_AND_BUTTONS_PANEL_H
