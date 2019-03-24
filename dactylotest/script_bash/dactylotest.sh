#!/bin/bash
################################################################################
#
# dactylotest.sh <output> <start_index>
#
# Conversion de texte pour dactylotest
#
#  - met le texte sur une seule ligne
#  - ajoute les espaces insécables avant les caractères doubles
#  - transforme les ... en points de suspensions
#  - transforme les ' en apostrophes typographiques
#  - transforme les oe et ae en ligatures pour les noms commun du dictionnaires
#  - formate en tableau php pour qu'il n'y ait plus qu'à copier/coller dans le
#    fichier frlong.php, la numérotation commençant à <start_index>
#
# Utilisation
#  À exécuter dans un dossier où les textes à nettoyer sont chacuns dans un
#  fichier .txt, la première ligne contenant le lien vers la source.
#
# Arguments
#  <output>: nom du fichier de sortie
#  <start_index>: nombre à partir duquel la numérotation d'indice de tableau
#                 commence
#
################################################################################
clean_file () {
    # première ligne = lien
    url=$(head -n 1 "$1")
    printf "\$textes[%d][\"source\"] = \"%s\";\n" "$2" "$url"
    # nettoyage des lignes suivantes
    printf "\$textes[%d][\"txt\"] = \"" "$2"
    tail -n +2 "$1" |
	# suppression des sauts de lignes
	tr '\n' ' ' |
	# espace insécable avant caractère double
	sed "s/ \([;:!?»]\)/ \1/g" |
	# espace insécable avant/après guillemet
	sed "s/« /« /g" |
	# points de suspension
	sed 's/[\.]\{3\}/…/g' |
	# apostrophe typographique
	sed "s/'/’/g" |
	# oe -> œ
	sed "s/voeu/vœu/g" |
	sed "s/voeux/vœux/g" |
	sed "s/soeur/sœur/g" |
	sed "s/noeud/nœud/g" |
	sed "s/loess/lœss/g" |
	sed "s/coeur/cœur/g" |
	sed "s/boeuf/bœuf/g" |
	sed "s/oeuvé/œuvé/g" |
	sed "s/roesti/rœsti/g" |
	sed "s/moeurs/mœurs/g" |
	sed "s/foetus/fœtus/g" |
	sed "s/foetal/fœtal/g" |
	sed "s/choeur/chœur/g" |
	sed "s/acoele/acœle/g" |
	sed "s/oeuvre/œuvre/g" |
	sed "s/oestre/œstre/g" |
	sed "s/oeneis/œneis/g" |
	sed "s/oeillé/œillé/g" |
	sed "s/oedipe/œdipe/g" |
	sed "s/oedème/œdème/g" |
	sed "s/phoenix/phœnix/g" |
	sed "s/poecile/pœcile/g" |
	sed "s/coeurse/cœurse/g" |
	sed "s/coenure/cœnure/g" |
	sed "s/coelome/cœlome/g" |
	sed "s/oeuvres/œuvres/g" |
	sed "s/oeuvrer/œuvrer/g" |
	sed "s/oestrus/œstrus/g" |
	sed "s/oestral/œstral/g" |
	sed "s/oersted/œrsted/g" |
	sed "s/oeillet/œillet/g" |
	sed "s/oechslé/œchslé/g" |
	sed "s/rancoeur/rancœur/g" |
	sed "s/monoecie/monœcie/g" |
	sed "s/consoeur/consœur/g" |
	sed "s/boehmite/bœhmite/g" |
	sed "s/Delboeuf/Delbœuf/g" |
	sed "s/écoeurer/écœurer/g" |
	sed "s/oeufrier/œufrier/g" |
	sed "s/oestrose/œstrose/g" |
	sed "s/oestrone/œstrone/g" |
	sed "s/oestriol/œstriol/g" |
	sed "s/oestridé/œstridé/g" |
	sed "s/oestrane/œstrane/g" |
	sed "s/oenocyte/œnocyte/g" |
	sed "s/oenochoé/œnochoé/g" |
	sed "s/oenanthe/œnanthe/g" |
	sed "s/oeillade/œillade/g" |
	sed "s/oeillère/œillère/g" |
	sed "s/oedipode/œdipode/g" |
	sed "s/oedipien/œdipien/g" |
	sed "s/soeurette/sœurette/g" |
	sed "s/rhoeadale/rhœadale/g" |
	sed "s/pomoerium/pomœrium/g" |
	sed "s/myxoedème/myxœdème/g" |
	sed "s/manoeuvre/manœuvre/g" |
	sed "s/loessique/lœssique/g" |
	sed "s/foeticide/fœticide/g" |
	sed "s/entamoeba/entamœba/g" |
	sed "s/dioestrus/diœstrus/g" |
	sed "s/désoeuvré/désœuvré/g" |
	sed "s/coeursage/cœursage/g" |
	sed "s/coenurose/cœnurose/g" |
	sed "s/coelostat/cœlostat/g" |
	sed "s/coelomate/cœlomate/g" |
	sed "s/coeliaque/cœliaque/g" |
	sed "s/écoeurant/écœurant/g" |
	sed "s/oeuvrette/œuvrette/g" |
	sed "s/oesophage/œsophage/g" |
	sed "s/oenothère/œnothère/g" |
	sed "s/oenophile/œnophile/g" |
	sed "s/oenomètre/œnomètre/g" |
	sed "s/oenologue/œnologue/g" |
	sed "s/oenologie/œnologie/g" |
	sed "s/oenilisme/œnilisme/g" |
	sed "s/oeillette/œillette/g" |
	sed "s/oeilleton/œilleton/g" |
	sed "s/oeillères/œillères/g" |
	sed "s/oedomètre/œdomètre/g" |
	sed "s/oedicnème/œdicnème/g" |
	sed "s/synoecisme/synœcisme/g" |
	sed "s/poeciliidé/pœciliidé/g" |
	sed "s/multicoeur/multicœur/g" |
	sed "s/manoeuvrer/manœuvrer/g" |
	sed "s/framboesia/frambœsia/g" |
	sed "s/froebélien/frœbélien/g" |
	sed "s/foetoscope/fœtoscope/g" |
	sed "s/foetologie/fœtologie/g" |
	sed "s/dryocoetes/dryocœtes/g" |
	sed "s/coelomique/cœlomique/g" |
	sed "s/coelentéré/cœlentéré/g" |
	sed "s/amphicoele/amphicœle/g" |
	sed "s/amoebicide/amœbicide/g" |
	sed "s/acoelomate/acœlomate/g" |
	sed "s/oestrogène/œstrogène/g" |
	sed "s/oestradiol/œstradiol/g" |
	sed "s/oenothèque/œnothèque/g" |
	sed "s/oenométrie/œnométrie/g" |
	sed "s/oedométrie/œdométrie/g" |
	sed "s/oedogonium/œdogonium/g" |
	sed "s/oedématier/œdématier/g" |
	sed "s/oedémateux/œdémateux/g" |
	sed "s/oecophylle/œcophylle/g" |
	sed "s/préoedipien/préœdipien/g" |
	sed "s/polyoestrus/polyœstrus/g" |
	sed "s/melanorhoea/melanorhœa/g" |
	sed "s/manoeuvrier/manœuvrier/g" |
	sed "s/manoeuvrant/manœuvrant/g" |
	sed "s/lymphoedème/lymphœdème/g" |
	sed "s/groenendael/grœnendael/g" |
	sed "s/foetoscopie/fœtoscopie/g" |
	sed "s/foetopathie/fœtopathie/g" |
	sed "s/endamoebidé/endamœbidé/g" |
	sed "s/dianthoecia/dianthœcia/g" |
	sed "s/contrecoeur/contrecœur/g" |
	sed "s/clin d'oeil/clin d'œil/g" |
	sed "s/coenonympha/cœnonympha/g" |
	sed "s/coelosomien/cœlosomien/g" |
	sed "s/blastocoele/blastocœle/g" |
	sed "s/asa foetida/asa fœtida/g" |
	sed "s/écoeurement/écœurement/g" |
	sed "s/oesophagite/œsophagite/g" |
	sed "s/oesophagien/œsophagien/g" |
	sed "s/oenotechnie/œnotechnie/g" |
	sed "s/oenologique/œnologique/g" |
	sed "s/oenanthique/œnanthique/g" |
	sed "s/oecuméniste/œcuméniste/g" |
	sed "s/oecuménisme/œcuménisme/g" |
	sed "s/oecuménique/œcuménique/g" |
	sed "s/thécamoebien/thécamœbien/g" |
	sed "s/stilboestrol/stilbœstrol/g" |
	sed "s/poecilogynie/pœcilogynie/g" |
	sed "s/poecilitique/pœcilitique/g" |
	sed "s/poecilandrie/pœcilandrie/g" |
	sed "s/manoeuvrable/manœuvrable/g" |
	sed "s/moeritherium/mœritherium/g" |
	sed "s/gymnamoebien/gymnamœbien/g" |
	sed "s/coelurosaure/cœlurosaure/g" |
	sed "s/coelioscopie/cœlioscopie/g" |
	sed "s/alstroemeria/alstrœmeria/g" |
	sed "s/oenothéracée/œnothéracée/g" |
	sed "s/oenométrique/œnométrique/g" |
	sed "s/oeilletonner/œilletonner/g" |
	sed "s/oedométrique/œdométrique/g" |
	sed "s/oecuménicité/œcuménicité/g" |
	sed "s/poecilotherme/pœcilotherme/g" |
	sed "s/myxoedémateux/myxœdémateux/g" |
	sed "s/mégaoesophage/mégaœsophage/g" |
	sed "s/lagerstroemia/lagerstrœmia/g" |
	sed "s/foetalisation/fœtalisation/g" |
	sed "s/dicrocoeliose/dicrocœliose/g" |
	sed "s/désoeuvrement/désœuvrement/g" |
	sed "s/oestrogénique/œstrogénique/g" |
	sed "s/oeilletonnage/œilletonnage/g" |
	sed "s/stoechiométrie/stœchiométrie/g" |
	sed "s/poecilothermie/pœcilothermie/g" |
	sed "s/oesophagotomie/œsophagotomie/g" |
	sed "s/oesophagoscope/œsophagoscope/g" |
	sed "s/ternstroemiacée/ternstrœmiacée/g" |
	sed "s/manoeuvrabilité/manœuvrabilité/g" |
	sed "s/hypooestrogénie/hypoœstrogénie/g" |
	sed "s/coeliochirurgie/cœliochirurgie/g" |
	sed "s/brachyoesophage/brachyœsophage/g" |
	sed "s/oesophagostomie/œsophagostomie/g" |
	sed "s/oesophagoscopie/œsophagoscopie/g" |
	sed "s/oesophagectomie/œsophagectomie/g" |
	sed "s/oedipianisation/œdipianisation/g" |
	sed "s/stoechiométrique/stœchiométrique/g" |
	sed "s/hyperoestrogénie/hyperœstrogénie/g" |
	sed "s/homo oeconomicus/homo œconomicus/g" |
	sed "s/oesophagoplastie/œsophagoplastie/g" |
	sed "s/éthinyloestradiol/éthinylœstradiol/g" |
	sed "s/oestroprogestatif/œstroprogestatif/g" |
	sed "s/oestrogénothérapie/œstrogénothérapie/g" |
	# ea -> æ
	sed "s/ælie/ælie/g" |
	sed "s/suæda/suæda/g" |
	sed "s/nævus/nævus/g" |
	sed "s/lælia/lælia/g" |
	sed "s/elæis/elæis/g" |
	sed "s/cæcum/cæcum/g" |
	sed "s/cæcal/cæcal/g" |
	sed "s/æolis/æolis/g" |
	sed "s/pygære/pygære/g" |
	sed "s/penæus/penæus/g" |
	sed "s/melæna/melæna/g" |
	sed "s/linnæa/linnæa/g" |
	sed "s/cuphæa/cuphæa/g" |
	sed "s/althæa/althæa/g" |
	sed "s/æthuse/æthuse/g" |
	sed "s/æschne/æschne/g" |
	sed "s/æchmea/æchmea/g" |
	sed "s/lonchæa/lonchæa/g" |
	sed "s/lætilia/lætilia/g" |
	sed "s/furcræa/furcræa/g" |
	sed "s/ex æquo/ex æquo/g" |
	sed "s/dracæna/dracæna/g" |
	sed "s/anabæna/anabæna/g" |
	sed "s/ægyrine/ægyrine/g" |
	sed "s/ægosome/ægosome/g" |
	sed "s/ægocère/ægocère/g" |
	sed "s/grællsia/grællsia/g" |
	sed "s/cratægus/cratægus/g" |
	sed "s/cæcilius/cæcilius/g" |
	sed "s/angræcum/angræcum/g" |
	sed "s/æpyornis/æpyornis/g" |
	sed "s/ægithale/ægithale/g" |
	sed "s/chamærops/chamærops/g" |
	sed "s/ægopodium/ægopodium/g" |
	sed "s/chamædorea/chamædorea/g" |
	sed "s/balæniceps/balæniceps/g" |
	sed "s/archæocète/archæocète/g" |
	sed "s/ænigmatite/ænigmatite/g" |
	sed "s/ægagropile/ægagropile/g" |
	sed "s/sphærotheca/sphærotheca/g" |
	sed "s/microsphæra/microsphæra/g" |
	sed "s/chænichthys/chænichthys/g" |
	sed "s/cæcotrophie/cæcotrophie/g" |
	sed "s/chamæcyparis/chamæcyparis/g" |
	sed "s/nævocarcinome/nævocarcinome/g" |
	sed "s/læliocattleya/læliocattleya/g" |
	sed "s/enterobacteriaceæ/enterobacteriaceæ/g" |
	# on vire les doubles espaces
	sed "s/ \+/ /g" |
	# on ne garde qu'environ 1075 caractères sans couper le dernier mot
	sed "s/\(.\{1075\}[^ ]*\).*/\1/"
    printf "…\";\n"
    echo ""
    echo ""
}

tmpfile=$(mktemp dactylotest_tmp.XXXXXX)
{
    counter=$2
    for file in *.txt
    do
	clean_file "$file" $counter
	counter=$((counter+1))
    done
} >> "$tmpfile"

mv "$tmpfile" "$1"
