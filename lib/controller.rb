
#require "bundler"  pluts nécessaraire car on a déjà config.ru
#undler.require
require "gossip"

#$:.unshift File.expand_path("./../lib", __FILE__)

class ApplicationController < Sinatra::Base	
	get"/" do
		erb:index, locals: {gossips: Gossip.all}
	end

	get"/gossips/:id/" do
		erb:each_gossip, locals: {gossips_elment: Gossips.find(params[:id])}
		redirect "/"
	end

	get"/gossips/new/" do
		erb:new_gossip
	end

	post"/gossips/new/" do
		a = Gossip.new("#{params["#{gossip_author}"]}", "#{params ["#{gossip_content}"]}")
		a.save
		redirect "/"
	end

	post"/gossips/new/" do
		puts "salut, je suis dans le serveur"
		puts "ceci est le contenu du hash params: #{params}"
		puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author :#{params["#{gossip_author}"]}"
		puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateura passé dans le champ gossip_content:
		#{params ["#{gossip_content}"]}"
		puts "ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
	end
end
