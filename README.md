# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]

* Rails version

Rails 5.2.3

* Configuration

$ rm the-gossip-project-v2/Gemfile.lock

$ gem uninstall rails
(=> 3. All versions)

$ gem uninstall railties
(=> 3. All versions)

$ cd the-gossip-project-v2

the-gossip-project-v2$ bundle install

the-gossip-project-v2$ rails -v
(=> Rails 5.2.3)

* Database creation

Mettre à jour le fichier config/database.yml (database, username et host pour le development).

the-gossip-project-v2$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails db:create

the-gossip-project-v2$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails db:migrate

* Database initialization

the-gossip-project-v2$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails db:seed 

* How to run the server
 
the-gossip-project-v2$ RUBYOPT='-W:no-deprecated -W:no-experimental' rails server

Resetting auto increment ID for users to 1
Resetting auto increment ID for cities to 1
Resetting auto increment ID for gossips to 1
Resetting auto increment ID for tags to 1
Resetting auto increment ID for join_table_tag_gossips to 1
Resetting auto increment ID for private_messages to 1
Resetting auto increment ID for join_table_recipient_pms to 1
Resetting auto increment ID for comments to 1
gossip1 author_id : 8
gossip2 author_id : 5
gossip1 author_id : 8
gossip2 author_id : 7
gossip1 author_id : 7
gossip2 author_id : 11
gossip1 author_id : 3
gossip2 author_id : 9
gossip1 author_id : 5
gossip2 author_id : 2
gossip1 author_id : 5
gossip2 author_id : 3
gossip1 author_id : 9
gossip2 author_id : 6
gossip1 author_id : 4
gossip2 author_id : 4
gossip1 author_id : 6
gossip2 author_id : 10
gossip1 author_id : 8
gossip2 author_id : 8

11 users créés :
ID | FIRST_NAME | LAST_NAME | EMAIL                      | AGE | DESCRIPTION                    | CITY.NAME            | CITY.ZIP_CODE
---|------------|-----------|----------------------------|-----|--------------------------------|----------------------|--------------
1  | Anonymous  | Anonymous | anonymous@gmail.com        | 89  | Utilisateur créé afin qu'il... | Paris                | 75000        
2  | Aymonde    | Boucher   | roy@gmail.com              | 33  | iggthhg874zia3q0zxmdkzcsbzv... | Suresnes             | 48160        
3  | Bruno      | Dubois    | dewayne@yahoo.fr           | 34  | ayznhfd3ju47l2rwjrdqua2j9rv... | Montélimar           | 74891        
4  | Eustache   | Bouchet   | orlando_turcotte@gmail.com | 17  | ikyq7ai07evdsqqgw6pdkrl3h5i... | Vitrolles            | 75402        
5  | Théodore   | Marie     | silas@gmail.com            | 106 | 3onnzlgs92ritcev4jmfmq573rm... | Dunkerque14          | 70735        
6  | Mathilde   | Thomas    | samuel_nicolas@yahoo.fr    | 38  | l06zvtzz8313tkezpmg2f984bxd... | Villejuif            | 26919        
7  | Geoffroy   | Marty     | byron@hotmail.fr           | 31  | o3xhstkfl5bzev6qv7uicbr9dth... | Le Perreux-sur-Marne | 43905        
8  | Salomon    | Paul      | carita_beer@hotmail.fr     | 95  | 5zv0yisoc7z55z0age7ozve7hfr... | La Ciotat            | 23462        
9  | Coraline   | Dupuy     | pei@gmail.com              | 101 | vf71fquyhudc7ma9o0ztov1k3ke... | Saint-Pierre         | 94153        
10 | Hélier     | Henry     | denisse_little@gmail.com   | 48  | pywkvfd53qs9eeuzoe6qxdpt20e... | Bron                 | 52401        
11 | Annibal    | Poulain   | danika_kuvalis@yahoo.fr    | 44  | y6vyjbo2aawggddhj78xpniz8i7... | Corbeil-Essonnes     | 39269        

11 cities créées :
ID | NAME                 | ZIP_CODE | CREATED_AT              | UPDATED_AT             
---|----------------------|----------|-------------------------|------------------------
1  | Paris                | 75000    | 2021-05-12 01:23:19     | 2021-05-12 01:23:19    
2  | Suresnes             | 48160    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
3  | Montélimar           | 74891    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
4  | Vitrolles            | 75402    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
5  | Dunkerque14          | 70735    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
6  | Villejuif            | 26919    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
7  | Le Perreux-sur-Marne | 43905    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
8  | La Ciotat            | 23462    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
9  | Saint-Pierre         | 94153    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
10 | Bron                 | 52401    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    
11 | Corbeil-Essonnes     | 39269    | 2021-05-12 01:23:20     | 2021-05-12 01:23:20    

20 gossips créés :
ID | TITLE      | CONTENT                        | AUTHOR.FIRST_NAME | AUTHOR.LAST_NAME | TAGS.TITLE  
---|------------|--------------------------------|-------------------|------------------|-------------
1  | Ct29osl    | Voluptatum nihil voluptatem... | Salomon           | Paul             | #distinctio 
2  | O6swkna8wy | Sequi est est. Mollitia ips... | Théodore          | Marie            | #distinctio 
3  | 13lnlub    | Ut voluptatem consectetur. ... | Salomon           | Paul             | #et         
4  | Cyv60jog9n | Ea facilis animi. Non imped... | Geoffroy          | Marty            | #et         
5  | Oyw6kww    | Perferendis aliquam et. Adi... | Geoffroy          | Marty            | #neque      
6  | 6m4h6id3al | Rem odio dolor. Quod dolore... | Annibal           | Poulain          | #neque      
7  | Phit6aq    | Est dolorum autem. A tenetu... | Bruno             | Dubois           | #rerum      
8  | Cg9wx0sbyt | Dolor voluptatum quia. Rem ... | Coraline          | Dupuy            | #rerum      
9  | 9kswwhg    | Ut numquam nobis. Placeat e... | Théodore          | Marie            | #facilis    
10 | Mj48vlnqrs | Enim quia eos. Delectus est... | Aymonde           | Boucher          | #facilis    
11 | Uksfvxe    | Labore corporis qui.           | Théodore          | Marie            | #occaecati  
12 | 6s5nyeyhcy | Et adipisci maxime. Error s... | Bruno             | Dubois           | #occaecati  
13 | Hxm78wy    | Quod ut odit.                  | Coraline          | Dupuy            | #repudiandae
14 | Efjxr8toek | Qui porro dolores. Aspernat... | Mathilde          | Thomas           | #repudiandae
15 | Xs6u988    | Consequatur unde ea. Cumque... | Eustache          | Bouchet          | #non        
16 | Zsvs6vax8f | Alias et nihil. Quia sunt p... | Eustache          | Bouchet          | #non        
17 | T8bypyk    | Blanditiis autem sit. Qui r... | Mathilde          | Thomas           | #harum      
18 | Sr9aoj4dhk | Quod pariatur eum. Quam eum... | Hélier            | Henry            | #harum      
19 | I799kzf    | Ducimus consectetur quod.      | Salomon           | Paul             | #minus      
20 | 7pz6fe3ofj | Odit sed dolorum. Tenetur d... | Salomon           | Paul             | #minus      

10 tags créés :
ID | TITLE       
---|-------------
1  | #distinctio 
2  | #et         
3  | #neque      
4  | #rerum      
5  | #facilis    
6  | #occaecati  
7  | #repudiandae
8  | #non        
9  | #harum      
10 | #minus      

10 private messages créés :
ID | CONTENT                        | SENDER.FIRST_NAME | SENDER.LAST_NAME | RECIPIENTS.FIRST_NAME | RECIPIENTS.LAST_NAME
---|--------------------------------|-------------------|------------------|-----------------------|---------------------
1  | Modi labore eaque. Aut sint... | Hélier            | Henry            | Théodore              | Marie               
2  | Fuga ea libero.                | Théodore          | Marie            | Geoffroy              | Marty               
3  | In ex provident. Beatae min... | Hélier            | Henry            | Aymonde               | Boucher             
4  | Quod quasi saepe. Sapiente ... | Eustache          | Bouchet          | Hélier                | Henry               
5  | Veniam non eum. Provident q... | Théodore          | Marie            | Bruno                 | Dubois              
6  | Nihil hic fugiat. Odit eos ... | Coraline          | Dupuy            | Annibal               | Poulain             
7  | Amet qui illo. Dolores dolo... | Coraline          | Dupuy            | Geoffroy              | Marty               
8  | Voluptatem exercitationem r... | Salomon           | Paul             | Théodore              | Marie               
9  | Nemo sint dolor. In nobis i... | Annibal           | Poulain          | Geoffroy              | Marty               
10 | Repellat incidunt possimus.... | Coraline          | Dupuy            | Hélier                | Henry               

20 comments créés :
ID | CONTENT                        | AUTHOR.FIRST_NAME | AUTHOR.LAST_NAME | GOSSIP.TITLE
---|--------------------------------|-------------------|------------------|-------------
1  | Accusamus tenetur sunt. Ad ... | Mathilde          | Thomas           | 6m4h6id3al  
2  | Enim labore dolore. Nostrum... | Bruno             | Dubois           | 6m4h6id3al  
3  | Et temporibus rerum.           | Geoffroy          | Marty            | Ct29osl     
4  | Nesciunt quod ullam. Praese... | Eustache          | Bouchet          | Oyw6kww     
5  | Fuga perspiciatis consectet... | Annibal           | Poulain          | 6m4h6id3al  
6  | Sint nostrum optio. Et volu... | Hélier            | Henry            | Cyv60jog9n  
7  | Quis sed dolorem. Maxime co... | Bruno             | Dubois           | Phit6aq     
8  | Ea velit et. Commodi eum la... | Théodore          | Marie            | Cyv60jog9n  
9  | Est rem velit.                 | Aymonde           | Boucher          | I799kzf     
10 | Rerum eaque eum. Mollitia v... | Eustache          | Bouchet          | 13lnlub     

