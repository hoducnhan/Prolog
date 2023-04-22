 % Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(10 000 000)).  % limit term space (10Mb)
:- set_prolog_stack(local,  limit(5 000 000)).  % limit environment space

% Your program goes here
% N20DCCN012: NGUYEN HUU DUNG, N20DCCN049: HO DUC NHAN
intro:-
    write('This is web game where you can find your favourite game :)'),nl,
    write('Enjoy your life. you will die !!!'), nl,nl.
choose_categorize:-
    write('Which category do you like ?'), nl,
    ask(['Action','Role-playing','Strategy','Adventure','Simulation','Sports&Racing'],6,0);
    choose_ask_text(1,6),
	read(X),
    (is_wrong_answer(1,6,X,category);is_right_answer(category,1,6,X)).
ask([First|Rest],Length,Index):-
    Length>0,
    NextLength is Length -1,
    NextIndex is Index +1,
    format('~w ~w ~n',[NextIndex,First]),
    ask(Rest,NextLength,NextIndex).
is_wrong_answer(Min,Max,X,Type_right_answer):-
    X=<Min;
    X>Max,
    TempMin is Min+1,
    write('Opps out of range, You should set your choice again in range '),
    format('(~w-~w)',[TempMin,Max]),
	read(A),
    (is_wrong_answer(Min,Max,A,Type_right_answer);is_right_answer(Type_right_answer,Min,Max,A)).

choose_ask_text(Min,Max):-
    write('To Choose, you enter the number in range '),
    format('(~w-~w)',[Min,Max]),nl.
start:-
    intro,
    choose_categorize.
% right answer
is_right_answer(category,Min,Max,X):-
    X>Min,
    X=<Max,
    answer_category(X).
is_right_answer(Type_answer,Min,Max,X):-
    X>Min,
    X=<Max,
    right_answer(Type_answer,X).

right_answer(action,1):-
	write('Type: Action-aracade_rhythm'),nl,
    category_detail_display(['hi_fi_rush','forza_horizon','djmax_respect_v'],0,3).
right_answer(action,2):-
	write('Type: Action-fighting_martial_arts'),nl,
    category_detail_display(['naraka','wwe','devil_may_cry_5'],0,3).
right_answer(action,3):-
	write('Type: Action-first_person_shooter'),nl,
    category_detail_display(['apex_legend','counter_strike','counter_strike'],0,3).
right_answer(action,4):-
	write('Type: Action-hack_slash'),nl,
    category_detail_display(['god_of_war','dead_cells','hades','hi_fi_rush'],0,4).
right_answer(action,5):-
	write('Type: Action-platformer_runner'),nl,
    category_detail_display(['it_takes_two','dead_cells','hi_fi_rush'],0,3).
right_answer(action,6):-
	write('Type: Action-third_person_shooter'),nl,
    category_detail_display(['read_dead','pubg','dead_space'],0,3).
right_answer(action,7):-
	write('Type: Action-shmup'),nl,
    category_detail_display(['brotato','cuphead','returnal'],0,3).

right_answer(role_playing,1):-
	write('Type: Role_playing-action_rpg'),nl,
    category_detail_display(['hogwarts_legacy','monster_hunter_rise','last_epoch'],0,3).
right_answer(role_playing,2):-
	write('Type: Role_playing-adventure_rpg'),nl,
    category_detail_display(['hogwarts_legacy','last_epoch','god_of_war'],0,3).
right_answer(role_playing,3):-
	write('Type: Role_playing-jrpg'),nl,
    category_detail_display(['monster_hunter_rise','tales_of_arise','automata'],0,3).
right_answer(role_playing,4):-
	write('Type: Role_playing-party_based'),nl,
    category_detail_display(['one_piece','omori','personal_4_golden'],0,3).
right_answer(role_playing,5):-
	write('Type: Role_playing-rogue_like'),nl,
    category_detail_display(['dead_cells','elden_ring','hades'],0,3).
right_answer(role_playing,6):-
	write('Type: Role_playing-strategy_rpg'),nl,
    category_detail_display(['dota_2','black_desert','crusader_kings_iii'],0,3).
right_answer(role_playing,7):-
	write('Type: Role_playing-turn_based'),nl,
    category_detail_display(['persona_5_royal','triangle_strategy','heros_adventure'],0,3).

right_answer(strategy,1):-
	write('Type: strategy-card_board'),nl,
    category_detail_display(['tabletop_simulator','slay_the_spire','inscryption'],0,3).
right_answer(strategy,2):-
	write('Type: strategy-city_settlement'),nl,
    category_detail_display(['skylines','anno_1800','rim_world'],0,3).
right_answer(strategy,3):-
	write('Type: strategy-grand_4x'),nl,
    category_detail_display(['stellaris','total_war','hearts_of_iron_iv'],0,3).
right_answer(strategy,4):-
	write('Type: strategy-military'),nl,
    category_detail_display(['hearts_of_iron_iv','counter_strike','company_of_heros_3'],0,3).
right_answer(strategy,5):-
	write('Type: strategy-real_time_strategy'),nl,
    category_detail_display(['total_war','dota_2','anno_1800'],0,3).
right_answer(strategy,6):-
	write('Type: strategy-tower_defense'),nl,
    category_detail_display(['dota_2','plant_vs_zombies','they_are_billions'],0,3).
right_answer(strategy,7):-
	write('Type: strategy-turn_based_strategy'),nl,
    category_detail_display(['total_war','persona_5_royal','company_of_heros_3'],0,3).

right_answer(adventure,1):-
	write('Type: adventure-adventure_rpg'),nl,
    category_detail_display(['hogwarts_legacy','last_epoch','god_of_war'],0,3).
right_answer(adventure,2):-
	write('Type: adventure-casual'),nl,
    category_detail_display(['skylines','anno_1800','rim_world'],0,3).
right_answer(adventure,3):-
	write('Type: adventure-hidden_object'),nl,
    category_detail_display(['stellaris','total_war','hearts_of_iron_iv'],0,3).
right_answer(adventure,4):-
	write('Type: adventure-metroidvania'),nl,
    category_detail_display(['hearts_of_iron_iv','counter_strike','company_of_heros_3'],0,3).
right_answer(adventure,5):-
	write('Type: adventure-puzzle'),nl,
    category_detail_display(['total_war','dota_2','anno_1800'],0,3).
right_answer(adventure,6):-
	write('Type: adventure-story_rich'),nl,
    category_detail_display(['dota_2','plant_vs_zombies','they_are_billions'],0,3).
right_answer(adventure,7):-
	write('Type: adventure-visual_novel'),nl,
    category_detail_display(['total_war','persona_5_royal','company_of_heros_3'],0,3).

right_answer(simulation,1):-
	write('Type: simulation-building_automation'),nl,
    category_detail_display(['tabletop_simulator','slay_the_spire','inscryption'],0,3).
right_answer(simulation,2):-
	write('Type: simulation-dating'),nl,
    category_detail_display(['skylines','anno_1800','rim_world'],0,3).
right_answer(simulation,3):-
	write('Type: simulation-farming_crafting'),nl,
    category_detail_display(['stellaris','total_war','hearts_of_iron_iv'],0,3).
right_answer(simulation,4):-
	write('Type: simulation-hobby_job'),nl,
    category_detail_display(['hearts_of_iron_iv','counter_strike','company_of_heros_3'],0,3).
right_answer(simulation,5):-
	write('Type: simulation-life_immersive'),nl,
    category_detail_display(['total_war','dota_2','anno_1800'],0,3).
right_answer(simulation,6):-
	write('Type: simulation-sandbox_physics'),nl,
    category_detail_display(['dota_2','plant_vs_zombies','they_are_billions'],0,3).
right_answer(simulation,7):-
	write('Type: simulation-space_flight'),nl,
    category_detail_display(['total_war','persona_5_royal','company_of_heros_3'],0,3).

right_answer(sports_racing,1):-
	write('Type: sports_racing-all_sports'),nl,
    category_detail_display(['tabletop_simulator','slay_the_spire','inscryption'],0,3).
right_answer(sports_racing,2):-
	write('Type: sports_racing-fishing_hunting'),nl,
    category_detail_display(['skylines','anno_1800','rim_world'],0,3).
right_answer(sports_racing,3):-
	write('Type: sports_racing-individual_sports'),nl,
    category_detail_display(['stellaris','total_war','hearts_of_iron_iv'],0,3).
right_answer(sports_racing,4):-
	write('Type: sports_racing-racing'),nl,
    category_detail_display(['hearts_of_iron_iv','counter_strike','company_of_heros_3'],0,3).
right_answer(sports_racing,5):-
	write('Type: sports_racing-racing_sim'),nl,
    category_detail_display(['total_war','dota_2','anno_1800'],0,3).
right_answer(sports_racing,6):-
	write('Type: sports_racing-sports_sim'),nl,
    category_detail_display(['dota_2','plant_vs_zombies','they_are_billions'],0,3).
right_answer(sports_racing,7):-
	write('Type: sports_racing-team_sports'),nl,
    category_detail_display(['total_war','persona_5_royal','company_of_heros_3'],0,3).
% create choose category answer
answer_category(1):-
    write('Which action type do you like ?'),nl,
    category_detail_display(['aracade_rhythm','fighting_martial_arts','first_person_shooter','hack_slash','platformer_runner','third_person_shooter','shmup'],0,7);
    choose_ask_text(1,7),
    read(X),
    (is_wrong_answer(0,7,X,action);is_right_answer(action,0,7,X)).
answer_category(2):-
    write('Which role playing type do you like ?'),nl,
    category_detail_display(['action_rpg','adventure_rpg','jrpg','party_based','rogue_like','strategy_rpg','turn_based'],0,7);
    choose_ask_text(1,7),
    read(X),
    (is_wrong_answer(0,7,X,role_playing);is_right_answer(role_playing,0,7,X)).
answer_category(3):-
    write('Which strategy type do you like ?'),nl,
    category_detail_display(['card_board','city_settlement','grand_4x','military','real_time_strategy','tower_defense','turn_based_strategy'],0,7);
    choose_ask_text(1,7),
    read(X),
    (is_wrong_answer(0,7,X,strategy);is_right_answer(strategy,0,7,X)).
answer_category(4):-
    write('Which adventure type do you like ?'),nl,
    category_detail_display(['adventure_rpg','casual','hidden_object','metroidvania','puzzle','story_rich','visual_novel'],0,7);
    choose_ask_text(1,7),
    read(X),
    (is_wrong_answer(0,7,X,adventure);is_right_answer(adventure,0,7,X)).
answer_category(5):-
    write('Which simulation type do you like ?'),nl,
    category_detail_display(['building_automation','dating','farming_crafting','hobby_job','life_immersive','sandbox_physics','space_flight'],0,7);
    choose_ask_text(1,7),
    read(X),
    (is_wrong_answer(0,7,X,simulation);is_right_answer(simulation,0,7,X)).
answer_category(6):-
    write('Which sports and racing type do you like ?'),nl,
    category_detail_display(['building_automation','dating','farming_crafting','hobby_job','life_immersive','sandbox_physics','space_flight'],0,7);
    choose_ask_text(1,7),
    read(X),
    (is_wrong_answer(0,7,X,sports_racing);is_right_answer(sports_racing,0,7,X)).

category_detail_display([First|Rest],Index,Max):-
    Index=<Max,
    NewIndex is Index+1,
    format('~w ~w ~n',[NewIndex,First]),
    category_detail_display(Rest,NewIndex,Max).
% game base on category

% detail-category-database
%action
category_detail(action,aracade_rhythm).
category_detail(action,fighting_martial_arts).
category_detail(action,first_person_shooter).
category_detail(action,hack_slash).
category_detail(action,platformer_runner).
category_detail(action,third_person_shooter).
category_detail(action,shmup).
%role playing
category_detail(role_playing,action_rpg).
category_detail(role_playing,adventure_rpg).
category_detail(role_playing,jrpg).
category_detail(role_playing,party_based).
category_detail(role_playing,rogue_like).
category_detail(role_playing,strategy_rpg).
category_detail(role_playing,turn_based).
%strategy
category_detail(strategy,card_board).
category_detail(strategy,city_settlement).
category_detail(strategy,grand_4x).
category_detail(strategy,military).
category_detail(strategy,real_time_strategy).
category_detail(strategy,tower_defense).
category_detail(strategy,turn_based_strategy).
%adventure
category_detail(adventure,adventure_rpg).
category_detail(adventure,casual).
category_detail(adventure,hidden_object).
category_detail(adventure,metroidvania).
category_detail(adventure,puzzle).
category_detail(adventure,story_rich).
category_detail(adventure,visual_novel).
%simulation
category_detail(simulation,building_automation).
category_detail(simulation,dating).
category_detail(simulation,farming_crafting).
category_detail(simulation,hobby_job).
category_detail(simulation,life_immersive).
category_detail(simulation,sandbox_physics).
category_detail(simulation,space_flight).
%sports_racing
category_detail(sports_racing,all_sports).
category_detail(sports_racing,fishing_hunting).
category_detail(sports_racing,individual_sports).
category_detail(sports_racing,racing).
category_detail(sports_racing,racing_sim).
category_detail(sports_racing,sports_sim).
category_detail(sports_racing,team_sports).
%game database game(type,name,storage,cost)
%action aracade_rhythm
game(aracade_rhythm,hi_fi_rush,20,405).
game(aracade_rhythm,forza_horizon,80,480).
game(aracade_rhythm,djmax_respect_v,100,1042).
%action fighting_martial_arts
game(fighting_martial_arts,naraka,35,360).
game(fighting_martial_arts,wwe,80,1000).
game(fighting_martial_arts,devil_may_cry_5,56,520).
%action first_person_shooter
game(first_person_shooter,apex_legend,75,free).
game(first_person_shooter,counter_strike,50,free).
game(first_person_shooter,destiny_2,56,free).
%action hack_slash
game(hack_slash,god_of_war,120,11390).
game(hack_slash,dead_cells,60,110).
game(hack_slash,hades,46,160).
game(hack_slash,hi_fi_rush,20,405).
%action platformer_runner
game(platformer_runner,it_takes_two,45,395).
game(platformer_runner,dead_cells,60,110).
game(platformer_runner,hi_fi_rush,20,405).
%action third_person_shooter
game(third_person_shooter,read_dead,35,330).
game(third_person_shooter,pubg,75,free).
game(third_person_shooter,dead_space,30,841).
%action shmup
game(shmup,brotato,25,56).
game(shmup,cuphead,10,131).
game(shmup,returnal,20,1399).

%role_playing action_rpg
game(action_rpg,hogwarts_legacy,35,56).
game(action_rpg,monster_hunter_rise,10,131).
game(action_rpg,last_epoch,20,1399).
%role_playing adventure_rpg
game(adventure_rpg,hogwarts_legacy,35,56).
game(adventure_rpg,last_epoch,20,1399).
game(adventure_rpg,god_of_war,120,11390).
%role_playing jrpg
game(jrpg,monster_hunter_rise,10,131).
game(jrpg,tales_of_arise,10,320).
game(jrpg,automata,10,199).
%role_playing party_based
game(party_based,one_piece,15,560).
game(party_based,omori,18,132).
game(party_based,personal_4_golden,24,139).
%role_playing rogue_like
game(rogue_like,dead_cells,60,110).
game(rogue_like,elden_ring,75,1211).
game(rogue_like,hades,46,160).
%role_playing strategy_rpg
game(strategy_rpg,dota_2,30,free).
game(strategy_rpg,black_desert,10,131).
game(strategy_rpg,crusader_kings_iii,45,350).
%role_playing turn_based
game(turn_based,persona_5_royal,25,560).
game(turn_based,triangle_strategy,15,749).
game(turn_based,heros_adventure,25,200).

%strategy card_board
game(card_board,tabletop_simulator,15,94).
game(card_board,slay_the_spire,30,75).
game(card_board,inscryption,26,free).
%strategy city_settlement
game(city_settlement,skylines,35,97).
game(city_settlement,anno_1800,20,free).
game(city_settlement,rim_world,46,free).
%strategy grand_4x
game(grand_4x,stellaris,15,free).
game(grand_4x,total_war,50,710).
game(grand_4x,hearts_of_iron_iv,26,100).
%strategy military
game(military,hearts_of_iron_iv,26,100).
game(military,counter_strike,50,free).
game(military,company_of_heros_3,26,1000).
%strategy real_time_strategy
game(real_time_strategy,total_war,50,710).
game(real_time_strategy,dota_2,30,free).
game(real_time_strategy,anno_1800,20,free).
%strategy tower_defense
game(tower_defense,dota_2,30,free).
game(tower_defense,plant_vs_zombies,50,118).
game(tower_defense,they_are_billions,26,187).
%strategy turn_based_strategy
game(turn_based_strategy,total_war,50,710).
game(turn_based_strategy,persona_5_royal,25,560).
game(turn_based_strategy,company_of_heros_3,26,1000).

%adventure adventure_rpg
game(adventure_rpg,tabletop_simulator,15,94).
game(adventure_rpg,slay_the_spire,30,75).
game(adventure_rpg,inscryption,26,free).
%adventure casual
game(casual,skylines,35,97).
game(casual,anno_1800,20,free).
game(casual,rim_world,46,free).
%adventure hidden_object
game(hidden_object,stellaris,15,free).
game(hidden_object,total_war,50,710).
game(hidden_object,hearts_of_iron_iv,26,100).
%adventure metroidvania
game(metroidvania,hearts_of_iron_iv,26,100).
game(metroidvania,counter_strike,50,free).
game(metroidvania,company_of_heros_3,26,1000).
%adventure puzzle
game(puzzle,total_war,50,710).
game(puzzle,dota_2,30,free).
game(puzzle,anno_1800,20,free).
%adventure story_rich
game(story_rich,dota_2,30,free).
game(story_rich,plant_vs_zombies,50,118).
game(story_rich,they_are_billions,26,187).
%adventure visual_novel
game(visual_novel,total_war,50,710).
game(visual_novel,persona_5_royal,25,560).
game(visual_novel,company_of_heros_3,26,1000).

%simulation building_automation
game(building_automation,tabletop_simulator,15,94).
game(building_automation,slay_the_spire,30,75).
game(building_automation,inscryption,26,free).
%simulation dating
game(dating,skylines,35,97).
game(dating,anno_1800,20,free).
game(dating,rim_world,46,free).
%simulation farming_crafting
game(farming_crafting,stellaris,15,free).
game(farming_crafting,total_war,50,710).
game(farming_crafting,hearts_of_iron_iv,26,100).
%simulation hobby_job
game(hobby_job,hearts_of_iron_iv,26,100).
game(hobby_job,counter_strike,50,free).
game(hobby_job,company_of_heros_3,26,1000).
%simulation life_immersive
game(life_immersive,total_war,50,710).
game(life_immersive,dota_2,30,free).
game(life_immersive,anno_1800,20,free).
%simulation sandbox_physics
game(sandbox_physics,dota_2,30,free).
game(sandbox_physics,plant_vs_zombies,50,118).
game(sandbox_physics,they_are_billions,26,187).
%simulation space_flight
game(space_flight,total_war,50,710).
game(space_flight,persona_5_royal,25,560).
game(space_flight,company_of_heros_3,26,1000).

%sports_racing all_sports
game(all_sports,tabletop_simulator,15,94).
game(all_sports,slay_the_spire,30,75).
game(all_sports,inscryption,26,free).
%sports_racing fishing_hunting
game(fishing_hunting,skylines,35,97).
game(fishing_hunting,anno_1800,20,free).
game(fishing_hunting,rim_world,46,free).
%sports_racing individual_sports
game(individual_sports,stellaris,15,free).
game(individual_sports,total_war,50,710).
game(individual_sports,hearts_of_iron_iv,26,100).
%sports_racing racing
game(racing,hearts_of_iron_iv,26,100).
game(racing,counter_strike,50,free).
game(racing,company_of_heros_3,26,1000).
%sports_racing racing_sim
game(racing_sim,total_war,50,710).
game(racing_sim,dota_2,30,free).
game(racing_sim,anno_1800,20,free).
%sports_racing sports_sim
game(sports_sim,dota_2,30,free).
game(sports_sim,plant_vs_zombies,50,118).
game(sports_sim,they_are_billions,26,187).
%sports_racing team_sports
game(team_sports,total_war,50,710).
game(team_sports,persona_5_royal,25,560).
game(team_sports,company_of_heros_3,26,1000).
/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/
