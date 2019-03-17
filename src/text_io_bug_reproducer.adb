------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC License (see COPYING file)                                  --
--                                                                          --
--                    Copyright (C) 2019 darkestkhan                        --
------------------------------------------------------------------------------
-- Permission to use, copy, modify, and/or distribute this software for any --
-- purpose with or without fee is hereby granted, provided that the above   --
-- copyright notice and this permission notice appear in all copies.        --
--                                                                          --
-- The software is provided "as is" and the author disclaims all warranties --
-- with regard to this software including all implied warranties of         --
-- merchantability and fitness. In no event shall the author be liable for  --
-- any special, direct, indirect, or consequential damages or any damages   --
-- whatsoever resulting from loss of use, data or profits, whether in an    --
-- action of contract, negligence or other tortious action, arising out of  --
-- or in connection with the use or performance of this software.           --
------------------------------------------------------------------------------

-- Ada.Text_IO.End_Of_File seems broken.

-- Windows 10, 64 bit gnat
-- $ gnat --version
-- GNAT Community 2018 (20180523-73)
-- Copyright (C) 1996-2018, Free Software Foundation, Inc.
-- This is free software; see the source for copying conditions.
-- There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with Ada.Text_IO;
procedure Text_IO_Bug_Reproducer is

  File : Ada.Text_IO.File_Type;

begin
  Ada.Text_IO.Open (File, Mode => Ada.Text_IO.In_File, Name => "data.txt");

  while not Ada.Text_IO.End_Of_File loop
    declare
      Line : constant String := Ada.Text_IO.Get_Line (File);
    begin
      Ada.Text_IO.Put_Line (Line);
    end;
  end loop;

  Ada.Text_IO.Close (File);
end Text_IO_Bug_Reproducer;
