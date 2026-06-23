// interface WordDocument{
//     void open();
// }

// interface PdfDocument{
//     void open();
// }

// interface ExcelDocument{
//     void open();
// }

// class WordDocumentImpl implements WordDocument{
//     @Override
//     public void open() {
//         System.out.println("Opening Word Document");
//     }
// }

// class PdfDocumentImpl implements PdfDocument{
//     @Override
//     public void open() {
//         System.out.println("Opening PDF Document");
//     }
// }

// class ExcelDocumentImpl implements ExcelDocument{
//     @Override
//     public void open() {
//         System.out.println("Opening Excel Document");
//     }
// }


interface WordDocument {
    void open();
    void setFont();
    void setMargins();
    void setPages();
}

interface PdfDocument {
    void open();
    void setFont();
    void setMargins();
    void setPages();
}

interface ExcelDocument {
    void open();
    void setFont();
    void setMargins();
    void setPages();
}

class WordDocumentImpl implements WordDocument {
    @Override
    public void open() {
        System.out.println("Opening Word Document");
        this.setFont();
        this.setMargins(); 
        this.setPages();
    }

    @Override
    public void setFont() {
        System.out.println("Setting font for Word Document");
    }

    @Override
    public void setMargins() {
        System.out.println("Setting margins for Word Document");
    }

    @Override
    public void setPages() {
        System.out.println("Setting pages for Word Document");
    }
}  

class PdfDocumentImpl implements PdfDocument {
    @Override
    public void open() {
        System.out.println("Opening PDF Document");
        this.setFont();
        this.setMargins();
        this.setPages();
    }

    @Override
    public void setFont() {
        System.out.println("Setting font for PDF Document");
    }

    @Override
    public void setMargins() {
        System.out.println("Setting margins for PDF Document");
    }

    @Override
    public void setPages() {
        System.out.println("Setting pages for PDF Document");
    }
}

class ExcelDocumentImpl implements ExcelDocument {
    @Override
    public void open() {
        System.out.println("Opening Excel Document");
        this.setFont();
        this.setMargins();
        this.setPages();
    }

    @Override
    public void setFont() {
        System.out.println("Setting font for Excel Document");
    }

    @Override
    public void setMargins() {
        System.out.println("Setting margins for Excel Document");
    }

    @Override
    public void setPages() {
        System.out.println("Setting pages for Excel Document");
    }
}