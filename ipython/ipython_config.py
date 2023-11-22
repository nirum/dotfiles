from IPython.terminal.prompts import Prompts, Token

# Configuration file for ipython.
c = get_config()

c.InteractiveShellApp.extensions = [ 
    "autoreload",
    "autotime",
    "loggerhead",
    "pyflyby",
#     'line_profiler',
#     'memory_profiler',
]

# A list of dotted module names of IPython extensions to load.
# c.TerminalIPythonApp.extensions = [
#     'line_profiler',
#     'memory_profiler',
# ]

# Enable GUI event loop integration with any of ('glut', 'gtk', 'gtk3', 'osx',
# 'pyglet', 'qt', 'qt5', 'tk', 'wx').
# c.InteractiveShellApp.gui = 'qt5'

# Configure matplotlib for interactive use with the default matplotlib backend.
# c.TerminalIPythonApp.matplotlib = 'qt5'

# Whether to display a banner upon starting IPython.
c.TerminalIPythonApp.display_banner = False

# Pre-load matplotlib and numpy for interactive use, selecting a particular
# matplotlib backend and loop integration.
# c.TerminalIPythonApp.pylab = 'agg'

# Enable GUI event loop integration with any of ('glut', 'gtk', 'gtk3', 'osx',
# 'pyglet', 'qt', 'qt5', 'tk', 'wx').
# c.TerminalIPythonApp.gui = 'qt5'

# Set the size of the output cache. The default is 1000
# c.TerminalInteractiveShell.cache_size = 5000

# Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = "$EDITOR"

# Use colors for displaying information about objects. Because this information
# is passed through a pager (like 'less'), and some pagers get confused with
# color codes, this capability can be turned off.
c.TerminalInteractiveShell.color_info = True

# Make IPython automatically call any callable object even if you didn't type
# explicit parentheses. For example, 'str 43' becomes 'str(43)' automatically.
# The value can be '0' to disable the feature, '1' for 'smart' autocall, where
# it is not applied if there are no more arguments on the line, and '2' for
# 'full' autocall, where all callable objects are automatically called (even if
# no arguments are present).
c.TerminalInteractiveShell.autocall = 2

# disable automatic formatting using black.
c.TerminalInteractiveShell.autoformatter = None

# Set the color scheme (NoColor, Linux, or LightBG).
c.TerminalInteractiveShell.colors = "linux"

# set the color scheme for syntax highlighting
c.TerminalInteractiveShell.highlighting_style = "monokai"

# The shell program to be used for paging.
# c.TerminalInteractiveShell.pager = 'less'

# Automatically call the pdb debugger after every exception.
c.TerminalInteractiveShell.pdb = False

c.InteractiveShell.sphinxify_docstring = False
c.InteractiveShell.mouse_support = True

c.PlainTextFormatter.max_width = 120

c.PlainTextFormatter.pprint = True

# don't omit anything on completion
c.IPCompleter.omit__names = 2

# When False [default]: the __all__ attribute is ignored
c.IPCompleter.limit_to__all__ = False

# If True, any %store-d variables will be automatically restored when IPython starts.
# c.StoreMagics.autorestore = True

# --------------------
# Prompt configuration
# --------------------

c.TerminalInteractiveShell.true_color = True


class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, u"\ufb26 ")]

    def out_prompt_tokens(self):
        return [(Token.OutPrompt, u"\u21AA ")]

    def rewrite_prompt_tokens(self):
        width = self._width()
        return [(Token.Prompt, (" " * (width - 2)) + "\u21A3 ")]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [(Token.Prompt, (" " * (width - 2)) + u"\u2502 ")]


c.TerminalInteractiveShell.prompts_class = MyPrompt
