class WordDocumentFactory {
    public WordDocument createDocument() {
        return new WordDocumentImpl();
    }
}

class PdfDocumentFactory {
    public PdfDocument createDocument() {
        return new PdfDocumentImpl();
    }
}

class ExcelDocumentFactory {
    public ExcelDocument createDocument() {
        return new ExcelDocumentImpl();
    }
}