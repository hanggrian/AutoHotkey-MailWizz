SLEEP_DIALOG_HIDE := 1000
SLEEP_DIALOG_SHOW := 2000
SLEEP_WEBPAGE_LOAD := 4000
SLEEP_IMPORT_PROCESS := 50000

; Convenient method to move pointer.
Move(x, y)
{
    MouseMove x, y, 0, "R"
}

; Convenient method to left click.
Click() {
    MouseClick "left"
}

; Make Windows file picker select the first file.
Jiggle() {
    Send("{Up}{Down}")
}

MsgBox "Move the pointer to 'Back to import options' and close this dialog."
Loop {
    ; back to import menu
    Click
    Sleep SLEEP_WEBPAGE_LOAD

    ; select live import
    Move -1525, -50
    Click
    Sleep SLEEP_DIALOG_SHOW

    ; choose file
    Move 485, 135
    Click
    Sleep SLEEP_DIALOG_SHOW

    ; delete last file and pick next
    Send "{Tab 11}"
    Jiggle
    Send "{Delete}"
    Sleep SLEEP_DIALOG_HIDE
    Jiggle
    Send "{Enter}"
    Sleep SLEEP_DIALOG_HIDE

    ; click upload
    Move 450, 110
    Click

    ; move back
    Move 590, -195
    Sleep SLEEP_IMPORT_PROCESS
}
