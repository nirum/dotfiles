from IPython.terminal.prompts import Prompts, Token
import os

# Configuration file for ipython.
c = get_config()

# A list of dotted module names of IPython extensions to load.
# c.InteractiveShellApp.extensions = [
#     'line_profiler',
#     'memory_profiler',
# ]

# A list of dotted module names of IPython extensions to load.
# c.TerminalIPythonApp.extensions = [
#     'line_profiler',
#     'memory_profiler',
# ]

# Enable GUI event loop integration with any of ('glut', 'gtk', 'gtk3', 'osx',
# 'pyglet', 'qt', 'qt5', 'tk', 'wx').
c.InteractiveShellApp.gui = 'osx'

# Configure matplotlib for interactive use with the default matplotlib backend.
c.TerminalIPythonApp.matplotlib = 'osx'

# Whether to display a banner upon starting IPython.
c.TerminalIPythonApp.display_banner = True
c.InteractiveShell.banner1 = 'banner1'
c.InteractiveShell.banner2 = 'banner2'

# Pre-load matplotlib and numpy for interactive use, selecting a particular
# matplotlib backend and loop integration.
#c.TerminalIPythonApp.pylab = 'osx'

# Enable GUI event loop integration with any of ('glut', 'gtk', 'gtk3', 'osx',
# 'pyglet', 'qt', 'qt5', 'tk', 'wx').
c.TerminalIPythonApp.gui = 'osx'

# Set the size of the output cache. The default is 1000
c.TerminalInteractiveShell.cache_size = 5000

# Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = '$EDITOR'

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

# Set the color scheme (NoColor, Linux, or LightBG).
c.TerminalInteractiveShell.colors = 'linux'

# set the color scheme for syntax highlighting
c.TerminalInteractiveShell.highlighting_style = 'monokai'

# The shell program to be used for paging.
# c.TerminalInteractiveShell.pager = 'less'

# Automatically call the pdb debugger after every exception.
c.TerminalInteractiveShell.pdb = True

c.InteractiveShell.sphinxify_docstring = True
c.InteractiveShell.mouse_support = True

c.PlainTextFormatter.max_width = 120

c.PlainTextFormatter.pprint = True

# don't omit anything on completion
c.IPCompleter.omit__names = 2

# When False [default]: the __all__ attribute is ignored
c.IPCompleter.limit_to__all__ = False

# If True, any %store-d variables will be automatically restored when IPython starts.
c.StoreMagics.autorestore = True

# ---------------------------
# PromptManager configuration
# ---------------------------

c.TerminalInteractiveShell.true_color = True


# class CustomPrompt(Prompts):

    # def in_prompt_tokens(self, cli=None):
        # return [(Token, os.getcwd()), (Token.Prompt, u'{color.LightGray}▢ ')]


# c.prompts = CustomPrompt(c)


# c.TerminalInteractiveShell.prompts_class =

# This is the primary interface for producing IPython's prompts.

# If True (default), each prompt will be right-aligned with the preceding one.
# c.PromptManager.justify = True

# Output prompt. '\#' will be transformed to the prompt number
# c.InteractiveShell.prompt_out = u'{color.LightGreen}\u21AA '
# c.PromptManager.out_template = u'{color.LightGreen}\u21AA '

# Continuation prompt.
# c.PromptManager.in2_template = u'{color.LightBlue}  \u2502 '

# Input prompt.  '\#' will be transformed to the prompt number
# c.PromptManager.in_template = 

# c.PromptManager.color_scheme = 'Linux'
