--Question 1
select 
    num_usager, 
    nom_usager, 
    prenom_usager 
from usagers  
where num_usager not in (select distinct 
    num_usager 
    from emprunts)
order by nom_usager ASC;

-- Question 2

select 
    oe.titre_oeuvre as titre_oeuvre, 
    oe.annee_oeuvre, 
    array_agg(au.nom_auteur) as auteurs 
from 
    oeuvres oe 
join 
    est_auteur ea on oe.num_oeuvre = ea.num_oeuvre 
join 
    auteurs au on au.num_auteur = ea.num_auteur 
group by 
    oe.titre_oeuvre, oe.annee_oeuvre 
having 
    count(ea.num_auteur) > 1;

-- Question 3
select au.prenom_auteur, au.nom_auteur, count(*) as  nombre_emprunts 
from auteurs au 
join est_auteur ea on au.num_auteur = ea.num_auteur 
join oeuvres oe on oe.num_oeuvre = ea.num_oeuvre 
join emprunts e on e.num_oeuvre = oe.num_oeuvre 
group by au.prenom_auteur, au.nom_auteur 
order by nombre_emprunts DESC;

-- Exo 2

-- Question 1

create function usagers_a_emprumter(user_id INT) returns BOOLEAN as $$
declare
    compteur_usages INT;
begin
    select count(*)
    into user_exists
    from emprunts
    where num_usager = user_id;

    if user_exists > 0 then
        return TRUE;
    else
        return FALSE;
    end if;
end; $$
LANGUAGE plpgsql;

-- Question 2
select 
    num_usager, 
    usagers_a_emprumter(num_usager) as "A un emprunt" 
from usagers;

-- Question 3
delete from usagers
where usagers_a_emprumter(num_usager) = FALSE;

-- Question 4
create or replace function check_emprunts_exists() returns trigger as $$
declare
    compteur_emprunts INT;
begin
    select count(*)
    into loan_exists
    from emprunts
    where num_usager = nouveau.num_usager;

    if loan_exists = 0 then
        RAISE EXCEPTION 'User must have at least one loan.';
    end if;
    return nouveau;
end;
$$ LANGUAGE plpgsql;

create trigger check_emprunts
before insert on usagers
for EACH row
EXECUTE PROCEDURE check_emprunts_exists();

-- Question 5

-- Test 1 pour l'insertion
insert into usagers (num_usager, nom_usager, prenom_usager)
VALUES (1111, 'Doe', 'John');

-- Test 2 pour l'insertion
begin;
insert into usagers (num_usager, nom_usager, prenom_usager)
values (2222, 'Smith', 'Jane');
insert into emprunts (num_usager, num_oeuvre, date_emprunt)
values (2222, 1, CURRENT_DATE);
commit;

-- Réponse Q6
/* il faut créer un trigger qui supprime les utilisateurs qui n'ont pas d'emprunt et */
