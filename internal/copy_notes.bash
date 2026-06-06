#!/usr/bin/env bash
copy_notes()
{
ls templates/ | xargs -n1 | sed 's#^#cp -r notes templates/#' | bash
}
copy_notes
