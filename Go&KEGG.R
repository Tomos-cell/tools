library(clusterProfiler)
library(org.Hs.eg.db)
library(stringr)
m=22 # determine the font size
theme = theme(title=element_text(size=m,hjust=0.2,lineheight=0.2),
              axis.title.x=element_text(size=m,hjust=0.5),
              axis.title.y=element_text(size=m,hjust=0.5),
              axis.text.x=element_text(size=m),
              axis.text.y=element_text(size=m),
              axis.ticks = element_line(size = 1,),
              axis.line = element_line(colour = "black"),
            #  panel.grid.major=element_blank(),panel.grid.minor=element_blank(),panel.background = element_blank(),
            #  panel.border = element_blank(), #legend.position="none",
              legend.text = element_text(size=m),
              plot.title = element_text(colour = "black", face = "bold", size = m, vjust = 1,hjust = 0.5))

entrezid <-bitr(hRPE_iRPE_hRPE_specific_ATAC_RNA, fromType = "ENSEMBL", 
              toType = c("SYMBOL","ENTREZID"),
              OrgDb = org.Hs.eg.db,drop =  FALSE )

ego<-enrichKEGG(gene       = entrezid$ENTREZID,
                 organism  = 'hsa',
                 keyType    = 'kegg',
                 pAdjustMethod = "none",
                 qvalueCutoff = 0.2)

ego2<-enrichGO(gene       = entrezid$ENTREZID,
                 OrgDb      = org.Hs.eg.db,
                 keyType    = 'ENTREZID',
                 ont        = "all",
                 pAdjustMethod = "BH",
                 qvalueCutoff = 0.2)

p <- dotplot(ego,showCategory=15)+theme

ggsave("The KEGG enrichment analysis of 62 hRPE genes.pdf", p , width = 10,height = 15)

p <- dotplot(ego2,showCategory=6,split="ONTOLOGY")+facet_grid(ONTOLOGY~.,scale='free')+theme
ggsave("The GO enrichment analysis of 62 hRPE genes.pdf", p , width = 10,height = 15)
