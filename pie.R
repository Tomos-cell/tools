### firstly new a vector storing value and its colname has its percentage
vector2 <- c(length(intersect(highATAC_highRNA$ENSEMBL,protein_coding_gene$V1)),
length(intersect(lowATAC_highRNA$ENSEMBL,protein_coding_gene$V1)),dim(lowATAC_highRNA)[1]+dim(highATAC_highRNA)[1]-length(intersect(highATAC_highRNA$ENSEMBL,protein_coding_gene$V1))-length(intersect(lowATAC_highRNA$ENSEMBL,protein_coding_gene$V1)))
names(vector2) <- paste0(round(vector2/sum(vector2)*100,2),"%")
pdf("pie_highRNA.pdf")
pie(vector2, border="white", col=c("#8DD3C7","#FFFFB3","grey"),cex=1.2,radius = 0.25)
legend(0.4, 0.4, legend = gsub("_"," ",c("Protein_coding_gene","Protein_coding_gene","Other")), fill = c("#8DD3C7","#FFFFB3","grey"),bty="n", cex=1)
dev.off()

### plot 2 class type pie
library(plotrix)
pieplot <- function(r=0.2,total=3654,CTCF=3580,color='#00a0e9',name="CTCF") {
    Other=total-CTCF
    cols <- c(NO='white',CTCF=color,Other='grey')
    names(cols) <- c("NO",name,"Other")
    pie(1, radius=r, init.angle=90, col="white", border=NA, labels='')
    nn = floating.pie(0, 0, c(CTCF, Other),radius=2*r,startpos=pi/2,col=cols[c(name, "Other")],border=NA)
    id = paste(c(round(CTCF/total*100,2),round(Other/total*100,2)),"%",sep="")
    pie.labels(0,0,nn,id,radius=2*r+0.005,minangle=0.2,explode=c(0.05,0.05),border=NA,cex=1.2)
    legend(2*r, 2*r, legend=gsub("_", " ", names(cols)[-1]),fill=cols[-1], bty="n", cex=1)
}
pdf("pie_highATAC_highRNA_percentage.pdf")
pieplot(r=0.2,total=19000,CTCF=10756,color = '#91D3C7',name="Protein_coding_gene")
dev.off()

pdf("pie_lowATAC_highRNA_percentage.pdf")
pieplot(r=0.2,total=6655,CTCF=2769,color = '#BEBAD9',name="Protein_coding_gene")
dev.off()