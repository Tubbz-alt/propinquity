#!/bin/bash
DRAWTREE=../drawtree
OTT=../../examples/2/taxonomy
EXAMPLE=../example2

function draw {
    local file=$1
    mkdir -p $(dirname $file)
    otc-relabel-tree --taxonomy=$OTT $EXAMPLE/$file --format-tax=%N > $file
    $DRAWTREE --input=$file --output=$file.svg \
	      --edge.width=3 "$@" --format=svg

}

draw cleaned_ott/cleaned_ott.tre
draw cleaned_phylo/ex_2@tree1.tre
draw cleaned_phylo/ex_2@tree2.tre
draw exemplified_phylo/ex_2@tree1.tre
draw exemplified_phylo/ex_2@tree2.tre
draw exemplified_phylo/taxonomy.tre --show.node.label=TRUE
draw grafted_solution/grafted_solution_ottnames.tre --show.node.label=TRUE
draw subproblems/14/1.tre
draw subproblems/14/2.tre
draw subproblems/14/3.tre

draw subproblems/17/1.tre
draw subproblems/17/2.tre
draw subproblems/17/3.tre

draw subproblem_solutions/ott14.tre
draw subproblem_solutions/ott17.tre

draw labelled_supertree/labelled_supertree.tre

d=toy_ambig
for f in abcd bcde soln1 soln2
do
    $DRAWTREE --input=${d}/${f}.tre --output=${d}/${f}.svg --edge.width=3 "$@" --format=svg
done

d=toy_pairwise_compat
for f in abc acd bcd s12 s13 s23
do
    $DRAWTREE --input=${d}/${f}.tre --output=${d}/${f}.svg --edge.width=3 "$@" --format=svg
done

d=uncontested_worsens_score
for f in ab1c acb2 tax opt returned
do
    $DRAWTREE --input=${d}/${f}.tre --output=${d}/${f}.svg --edge.width=3 "$@" --format=svg
done
