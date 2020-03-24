# find puerto rico mortality report on system
fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
system("cmd.exe", input = paste("start", fn))

library(pdftools)
library(stringr)

txt = pdf_text(fn)
x = str_split(txt[9], '\n')
class(x)
length(x)
s = x[[1]]
class(s)
length(s)
s = str_trim(s)
header_index = str_which(s, "2015")[1]
tmp = str_split(s[header_index], "\\s+", simplify = TRUE)
month = tmp[1]
header = tmp[-1]
header[3]

total_index = str_which(s, "Total")
total_index

n = str_count(s, "\\d+")
sum(n == 1)
out <- c(1:header_index, which(n==1), tail_index:length(s))
s <- s[-out]
length(s)