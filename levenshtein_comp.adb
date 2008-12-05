with ada.command_line;
with ada.strings.fixed;
with ada.strings;
with ada.text_io;
with levenshtein;

procedure levenshtein_comp is
  package io renames ada.text_io;
  package str renames ada.strings;
  package str_fixed renames ada.strings.fixed;
  package cmdline renames ada.command_line;
begin
  if cmdline.argument_count < 2 then
    io.put_line (io.current_error, "levenshtein-comp: usage: str0 str1");
    cmdline.set_exit_status (111);
    return;
  end if;

  declare
    distance : constant natural := levenshtein.distance
      (cmdline.argument (1), cmdline.argument (2));
  begin
    io.put_line (str_fixed.trim (natural'image (distance), str.left));
  end;
end levenshtein_comp;
