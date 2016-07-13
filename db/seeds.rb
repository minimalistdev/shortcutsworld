# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

mac = So.create(name: 'Mac OS', img: File.open(File.join(Rails.root, './app/assets/images/macos.jpg')))
windows = So.create(name: 'Windows', img: File.open(File.join(Rails.root, './app/assets/images/windows.jpg')))
ubuntu = So.create(name: 'Ubuntu', img: File.open(File.join(Rails.root, './app/assets/images/ubuntu.jpg')))

App.create!(so: mac, name: 'Mac OS', img: File.open(File.join(Rails.root, './app/assets/images/macos.jpg')))
App.create!(so: windows, name: 'Windows', img: File.open(File.join(Rails.root, './app/assets/images/windows.jpg')))
App.create!(so: ubuntu, name: 'Ubuntu', img: File.open(File.join(Rails.root, './app/assets/images/ubuntu.jpg')))