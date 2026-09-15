local ignore_immutable = false

function setup(config)
  config.action("toggle ignore immutable", function()
    ignore_immutable = not ignore_immutable
    if ignore_immutable then
      flash("ignore immutable is turned on")
    else
      flash("ignore immutable is turned off")
    end
  end, {
    key = "G",
    scope = "revisions"
  })


  -- Ouvrir fichier dans nvim (scope corrigé !)
  config.action("edit file in nvim", function()
    local file = context.file()
    if file then
      exec_shell("nvim " .. file)
    else
      flash("No file selected")
    end
  end, {
    key = "e",
    scope = "revisions.details",
    desc = "edit in nvim"
  })


  config.action("revisions.rebase.apply", function()
    jjui.builtin.revisions.rebase.apply({ force = ignore_immutable })
    jjui.builtin.revisions.squash.apply({ force = ignore_immutable })
  end)
end
