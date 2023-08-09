library(reshape2)
library(ggpubr)

hRPE_iRPE_melt <- melt(hRPE_iRPE,id=c("identity"),measure=c("H","iRPE"))
hRPE_iRPE_melt$value2 <- log2(hRPE_iRPE_melt$value+1)
p <- ggboxplot(hRPE_iRPE_melt,y="value2",x="variable",add="mean",fill = "variable") + facet_grid(.~identity)+stat_compare_means(method="wilcox.test") + xlab("")+ylab("Gene expression (FPKM)")+labs(fill="") + theme + theme(strip.text.x = element_text(size = 12))
