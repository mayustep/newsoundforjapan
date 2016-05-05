if Rails.env.development? && false
  Process.detach spawn('watchify -vd -p browserify-hmr -t vueify -e app/assets/components/index.js -o app/assets/javascripts/components.js')
end
