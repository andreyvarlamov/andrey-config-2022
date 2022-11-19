return function()
  for name,_ in pairs(package.loaded) do
		if name:match('^andrey') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end
