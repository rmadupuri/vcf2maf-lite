# vcf2maf_lite

vcf2maf_lite is a lightweight Python adaptation of the [vcf2maf Perl tool](https://github.com/mskcc/vcf2maf), designed to convert the VCF format to MAF format without adding variant annotations. For annotating a MAF file, [Genome Nexus](https://github.com/genome-nexus/genome-nexus-annotation-pipeline) can be utilized.

Usage:

```
python3 vcf2maf_lite.py --help

  -i | --input-data             A list of .vcf files or input data directories, separated by commas [required]
  -o | --output-directory       output data directory [optional]
  -c | --center                 name of the center (standard MAF field = 'Center') [optional]
  -s | --sequence-source        Sequencing source (standard MAF field = 'Sequencing_Source'), e.g., WXS or WGS [optional]
  -t | --tumor-id               The ID of the tumor sample utilized in the genotype columns of the VCF file. [optional]
  -n | --normal-id              The ID of the normal sample utilized in the genotype columns of the VCF file. [optional]
```

### Requirements
```
python 3
```

### Running the tool example
```
python3 vcf2maf.py --input-data /data/vcf --output-directory /data/maf/ --center-name CTR --sequence-source WGS --tumor-id Tumor --normal-id Normal
```

This command converts the VCF files in /vcf folder to MAF format. 
- The `--input-data` option is used to specify either a single VCF file or a directory containing multiple VCF files (separated by commas). This option supports passing multiple input files or directories at once.
- The `--output-directory` option allows you to specify the directory where the MAF files will be saved. If no output path is provided, the default output directory `vcf2maf_output` will be used in the current working directory. 
- The `--tumor-id` option allows you to specify the ID of the tumor sample used in the genotype columns of the VCF file. If the option is not used, the script will automatically identify the tumor ID from either the `tumor_sample` keyword in the meta data lines or the sample columns from VCF header.
- The `--normal-id` option allows you to specify the ID of the normal sample used in the genotype columns of the VCF file. If the option is not used, the script will automatically identify the normal ID from either the `normal_sample` keyword in the meta data lines or the sample columns from VCF header.

### Germline files

If `germline` is in the filename then `vcf2maf_lite.py` will assume that the file contains germline data. This will set the value in the output MAF `Mutation_Status` column to "GERMLINE". Please follow this naming convention if the mutation data file(s) are germline data.

# Points to note:
1. If 'normal' in filename, will skip porcessing the file.

## Sequencing formats supported:


### How do we pick the tumor/normal column:
- if the tumor_id and normal_id are provided, then use them to find the sample data columns
- The provided Tumor ID: '{tumor_id}' or Normal ID: '{normal_id}' were not found in the VCF file. Parsing the names and sample ids in the old way (from column headers).
- if tumor_sample and normal_sample in the meta headers. If only one found raises an exception
- 








