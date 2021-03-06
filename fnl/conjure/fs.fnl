(module conjure.fs
  {require {nvim conjure.aniseed.nvim
            a conjure.aniseed.core
            config conjure.config}})

(defn config-dir []
  "Return $XDG_CONFIG_HOME/conjure.
  Defaulting the config directory to $HOME/config."
  (..  (or (config.env "XDG_CONFIG_HOME")
           (.. (config.env "HOME") "/.config"))
      "/conjure"))

(defn findfile [name path]
  "Wrapper around Neovim's findfile() that returns nil
  instead of an empty string."
  (let [res (nvim.fn.findfile name path)]
    (when (not (a.empty? res))
      res)))

(defn resolve [name]
  "Resolve a file name to it's full path by looking in the current
  directory upwards followed by $XDG_CONFIG_HOME/conjure"
  (or
    (findfile name ".;")
    (findfile name (.. (config-dir) ";"))))
