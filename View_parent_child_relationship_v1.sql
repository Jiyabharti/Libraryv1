use library_db_v5;

create view Parent_Child_Relationship AS
select 
g.AdultID as Parent,
g.ChildID as Child,
-- ai.PersonID as ParentPersonID,
pa.Firstname as ParentFirstName,
pa.Lastname as ParentLastName,
-- paa.AddressID as ParentAddressID,
paa.Housenumber as ParentHouseNo,
paa.Streetname as ParentStreet,
paa.postcode as ParentPostcode,
-- ci.PersonID as ChildPersonID,
pc.Firstname as ChildFirstName,
pc.Lastname as ChildLastName,
-- pca.AddressID as ChildAddressID,
pca.Housenumber as ChildHouseNo,
pca.Streetname as ChildStreet,
pca.postcode as ChildPostcode
from guardian g
join adult_identifier ai
on g.AdultID = ai.AdultID
join person pa
on ai.PersonID = pa.Personid
join address paa
on pa.AddressID = paa.AddressID
join child_identifier ci
on g.ChildID = ci.ChildID
join person pc
on ci.PersonID = pc.PersonID
join address pca
on pc.AddressID = pca.AddressID;

select * from parent_child_relationship;





