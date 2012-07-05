def setup_history():
  import atexit
  import os
  import readline
  import rlcompleter
  import sys

  # change autocomplete to tab
  readline.parse_and_bind("tab: complete")

  history_path = os.path.expanduser("~/.pyhistory")

  def save_history(history_path=history_path):
      import readline
      readline.write_history_file(history_path)

  if os.path.exists(history_path):
      readline.read_history_file(history_path)

  atexit.register(save_history)
setup_history()
del setup_history
