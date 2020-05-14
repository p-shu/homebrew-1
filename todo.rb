def install
  bin.install "todo"

  # Avoid "Empty installation" error which will be caused when the only
  # "todo" file is installed.
  bin.install "empty"
end
