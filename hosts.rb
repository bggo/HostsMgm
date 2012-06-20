#!/usr/bin/ruby
require "rubygems"
require "gtk2"
require "fileutils"

def create_structure()
	#TO-DO - Make /etc/hosts.d/ directory, inside, backup, and templates	
end

def bkp_hosts(hosts_path)
	if File.exist?("#{hosts_path}")
		FileUtils.cp "#{hosts_path}", '/tmp/hosts'
	end
	#TO-DO - Improve backup, implement backup versions inside /etc/hosts.d
end

def check_hosts(hosts_path)
	if File.exist?("#{hosts_path}") != true
		return false
	elsif File.readable?("#{hosts_path}") != true
		return false
	elsif File.writable?("#{hosts_path}") != true	
		return false
	else
		return true
	end
end

#def initialize(hosts_path)
	#File.open('/etc/hosts', 'w')
	# Initialize Hosts	
#end

def parse_hosts(hosts_path)

end

bkp_hosts("/etc/hosts")
status=check_hosts("/etc/hosts")
puts status

#Gtk.init
#window = Gtk::Window.new
##Definindo o título da Janela
#window.title = "Janela com GTK"
#Definindo o tamanho da janela
#window.set_default_size 250, 200
#Criando sinal de fechar
#window.signal_connect("destroy"){ Gtk.main_quit }
#Posicionando no centro
#window.set_window_position Gtk::Window::POS_CENTER
#Adicionando botão
#window.add Gtk::Button.new "Botao"
#window.show_all
#Gtk.main
