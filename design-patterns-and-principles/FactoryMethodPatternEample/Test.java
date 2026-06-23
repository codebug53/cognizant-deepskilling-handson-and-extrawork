public class Test {
    public static void main(String args[]){
        WordDocumentFactory wordFactory = new WordDocumentFactory();
        PdfDocumentFactory pdfFactory = new PdfDocumentFactory();
        ExcelDocumentFactory excelFactory = new ExcelDocumentFactory();
        WordDocument wordDoc = wordFactory.createDocument();
        PdfDocument pdfDoc = pdfFactory.createDocument();   
        ExcelDocument excelDoc = excelFactory.createDocument();
        wordDoc.open();
        pdfDoc.open();
        excelDoc.open();
    }
}