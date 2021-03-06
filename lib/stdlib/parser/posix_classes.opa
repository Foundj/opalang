/*
    Copyright © 2011 MLstate

    This file is part of Opa.

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

/*
POSIX characters classes.
Remember that these classes must depend of the localization of the user.
That's why I only included the first 128 characters.

TODO if we do localization : Equivalence classes. See the POSIX doc.
[=e=] ----> parser r=[eéèêë...] -> r

Class           Meaning
[:alnum:]       Alphanumeric characters.
[:alpha:]       Alphabetic characters.
[:blank:]       Space and TAB characters.
[:cntrl:]       Control characters.
[:digit:]       Numeric characters.
[:graph:]       Characters that are both printable and visible. (A space is printable but not visible, whereas an ‘a’ is both.)
[:lower:]       Lowercase alphabetic characters.
[:print:]       Printable characters (characters that are not control characters).
[:punct:]       Punctuation characters (characters that are not letters, digits, control characters, or space characters).
[:space:]       Space characters (such as space, TAB, and formfeed, to name a few).
[:upper:]       Uppercase alphabetic characters.
[:xdigit:]      Characters that are hexadecimal digits.
*/

Posix = {{
  alnum = parser r=(alpha | digit) -> r
  alpha = parser r=(lower | upper) -> r
  blank = parser r=[ 	]-> r
  cntrl = parser r=[ --] -> r
  digit = parser r=[0-9] -> r
  graph = parser r=(alnum | punct) -> r
  lower = parser r=[a-z] -> r
  print = parser r=(graph | space) -> r
  punct = parser r=[!-/:-@[-`{-~] -> r
  space = parser r=[	-] -> r
  upper = parser r=[a-Z] -> r
  xdigit = parser r=(digit | [a-fA-F]) -> r
}}
