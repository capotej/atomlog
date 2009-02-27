# AtomLog

AtomLog is a library for converting ruby's Logger format into an Atom feed

## Installation

Add the github gem source if you haven't already:
    
    gem sources -a http://gems.github.com
    
Install the gem:

    gem install jcapote-atomlog

## Usage

### From within your applications:

Basic usage:

    require 'atom_log'
    a = AtomLog::Generator.new('path/to/log.log')
    a.to_atom #=> feed as a string

For large or rapidly growing log files, it's useful only to see the last 10 or so events; To achieve this, just pass how many lines back you want to go to the generator constructor as the 2nd argument:

    require 'atom_log'
    a = AtomLog::Generator.new('path/to/log.log', 100)
    a.to_atom #=> feed as a string

Or if you want to parse the log file into your own format (sql, json, etc), you can use the parser directly (this also takes the lines desired as the 2nd argument):

    require 'atom_log'
    a = AtomLog::Parser.new('path/to/log.log', 100)
    a.parse #=> array of log fields

### From the shell:

It comes with a standalone tool, log2atom; use as such:

    log2atom logger-file.log


## Performance

Out of curiousity, I decided to benchmark reading a 4.4mb log file against all the ruby implementations on my machine, here are the results:


    30s: ruby 1.9.1p0 (2009-01-30 revision 21907) [i386-darwin9.2.0]

    34s: jruby --server 1.1.6RC1 (ruby 1.8.6 patchlevel 114) (2008-12-03 rev 8263) [i386-java]

    46s: jruby 1.1.6RC1 (ruby 1.8.6 patchlevel 114) (2008-12-03 rev 8263) [i386-java]

    53s: ruby 1.8.6 (2007-09-24 patchlevel 111) [universal-darwin9.0]


## License and Author

Copyright 2009 Julio Capote (jcapote@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
