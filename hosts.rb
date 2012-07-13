#!/usr/bin/ruby
require "rubygems"
require "gtk2"
require "fileutils"
require "yaml"

def init()

        Dir.mkdir("/etc/hosts.d") unless File.exists?("/etc/hosts.d")
        Dir.mkdir("/etc/hosts.d/backup") unless File.exists?("/etc/hosts.d/backup")
        Dir.mkdir("/etc/hosts.d/templates") unless File.exists?("/etc/hosts.d/templates")
        Dir.mkdir("/etc/hosts.d/db") unless File.exists?("/etc/hosts.d/db")
	
end

def load_config_file()
	# LoadFile
	
	if File.exists?("/etc/hosts.d/hostsd.conf")
        	loadedConf = YAML.load_file '/etc/hosts.d/hostsd.conf'
	else
        	raise "Missing config file, please check . . . exiting"
        exit 1
	end

	# Load global conf

	globalConf = loadedConf.fetch('global')
	@root_path = globalConf['root_path']
	@backup_path = globalConf['backup_path']
	@template_path  = globalConf['template_path'] 
	@sqlite_path = globalConf['sqlite_path'] 
	
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

### TODO checar se o diretório existe
## se existir carregar arquivo de configuraçao
##,senao executar init e uma arquivo de configuração demo e carrega-lo


load_config_file
puts @sqlite_path

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
