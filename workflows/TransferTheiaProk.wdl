version 1.0

workflow TransferTheiaProk {

    input {
        File? read1_clean
        File? read2_clean
        File? assembly_fasta
        File? contigs_gfa
        File? contigs_fastg
        File? contigs_lastgraph
        File? quast_report
        File? cg_pipeline_report
        File? busco_report
        File? gambit_report
        File? gambit_closest_genomes
        File? ani_output_tsv
        File? amrfinderplus_all_report
        File? amrfinderplus_amr_report
        File? amrfinderplus_stress_report
        File? amrfinderplus_virulence_report
        File? resfinder_pheno_table
        File? resfinder_pheno_table_species
        File? resfinder_seqs
        File? resfinder_results
        File? resfinder_pointfinder_pheno_table
        File? resfinder_pointfinder_results
        File? ts_mlst_results
        File? prokka_gff
        File? prokka_gbk
        File? prokka_sqn
        File? plasmidfinder_results
        File? plasmidfinder_seqs
        File? kleborate_output_file
        File? legsta_results
        File? pbptyper_pbptype_predicted_tsv
        File? poppunk_gps_external_cluster_csv
        File? midas_report
        File? seroba_details
        File? kraken2_classified_read1
        File? kraken2_classified_read2
        File? kraken2_classified_report
        File? kraken2_report
        File? kraken2_unclassified_read1
        File? kraken2_unclassified_read2
        String out_dir
    }

    call transfer_outputs {
        input:
            read1_clean = read1_clean,
            read2_clean = read2_clean,
            assembly_fasta = assembly_fasta,
            contigs_gfa = contigs_gfa,
            contigs_fastg = contigs_fastg,
            contigs_lastgraph = contigs_lastgraph,
            quast_report = quast_report,
            cg_pipeline_report = cg_pipeline_report,
            busco_report = busco_report,
            gambit_report = gambit_report,
            gambit_closest_genomes = gambit_closest_genomes,
            ani_output_tsv = ani_output_tsv,
            amrfinderplus_all_report = amrfinderplus_all_report,
            amrfinderplus_amr_report = amrfinderplus_amr_report,
            amrfinderplus_stress_report = amrfinderplus_stress_report,
            amrfinderplus_virulence_report = amrfinderplus_virulence_report,
            resfinder_pheno_table = resfinder_pheno_table,
            resfinder_pheno_table_species = resfinder_pheno_table_species,
            resfinder_seqs = resfinder_seqs,
            resfinder_results = resfinder_results,
            resfinder_pointfinder_pheno_table = resfinder_pointfinder_pheno_table,
            resfinder_pointfinder_results = resfinder_pointfinder_results,
            ts_mlst_results = ts_mlst_results,
            prokka_gff = prokka_gff,
            prokka_gbk = prokka_gbk,
            prokka_sqn = prokka_sqn,
            plasmidfinder_results = plasmidfinder_results,
            plasmidfinder_seqs = plasmidfinder_seqs,
            kleborate_output_file = kleborate_output_file,
            legsta_results = legsta_results,
            pbptyper_pbptype_predicted_tsv = pbptyper_pbptype_predicted_tsv,
            poppunk_gps_external_cluster_csv = poppunk_gps_external_cluster_csv,
            seroba_details = seroba_details,
            midas_report = midas_report,
            kraken2_classified_read1 = kraken2_classified_read1,
        	kraken2_classified_read2 = kraken2_classified_read2,
        	kraken2_classified_report = kraken2_classified_report,
        	kraken2_report = kraken2_report,
        	kraken2_unclassified_read1 = kraken2_unclassified_read1,
        	kraken2_unclassified_read2 = kraken2_unclassified_read2,
            out_dir = out_dir
    }

    output {
        String transfer_date = transfer_outputs.transfer_date
    }
}

task transfer_outputs {
    input {
      File? read1_clean
      File? read2_clean
      File? assembly_fasta
      File? contigs_gfa
      File? contigs_fastg
      File? contigs_lastgraph
      File? quast_report
      File? cg_pipeline_report
      File? busco_report
      File? gambit_report
      File? gambit_closest_genomes
      File? ani_output_tsv
      File? amrfinderplus_all_report
      File? amrfinderplus_amr_report
      File? amrfinderplus_stress_report
      File? amrfinderplus_virulence_report
      File? resfinder_pheno_table
      File? resfinder_pheno_table_species
      File? resfinder_seqs
      File? resfinder_results
      File? resfinder_pointfinder_pheno_table
      File? resfinder_pointfinder_results
      File? ts_mlst_results
      File? prokka_gff
      File? prokka_gbk
      File? prokka_sqn
      File? plasmidfinder_results
      File? plasmidfinder_seqs
      File? kleborate_output_file
      File? legsta_results
      File? pbptyper_pbptype_predicted_tsv
      File? poppunk_gps_external_cluster_csv
      File? seroba_details
      File? midas_report
      File? kraken2_classified_read1
      File? kraken2_classified_read2
      File? kraken2_classified_report
      File? kraken2_report
      File? kraken2_unclassified_read1
      File? kraken2_unclassified_read2
      String out_dir
      Int disk_size = 8
    }

    String outdirpath = sub(out_dir, "/$", "")

    command <<<

        gsutil -m cp ~{read1_clean} ~{outdirpath}/filtered_reads/
        gsutil -m cp ~{read2_clean} ~{outdirpath}/filtered_reads/
        gsutil -m cp ~{assembly_fasta} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{contigs_gfa} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{contigs_fastg} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{contigs_lastgraph} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{quast_report} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{cg_pipeline_report} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{busco_report} ~{outdirpath}/assembly_and_assemtly_qc/
        gsutil -m cp ~{gambit_report} ~{outdirpath}/taxon_id/
        gsutil -m cp ~{gambit_closest_genomes} ~{outdirpath}/taxon_id/
        gsutil -m cp ~{ani_output_tsv} ~{outdirpath}/ani-mummer/
        gsutil -m cp ~{amrfinderplus_all_report} ~{outdirpath}/amrfinderplus/
        gsutil -m cp ~{amrfinderplus_amr_report} ~{outdirpath}/amrfinderplus/
        gsutil -m cp ~{amrfinderplus_stress_report} ~{outdirpath}/amrfinderplus/
        gsutil -m cp ~{amrfinderplus_virulence_report} ~{outdirpath}/amrfinderplus/
        gsutil -m cp ~{resfinder_pheno_table} ~{outdirpath}/resfinder/
        gsutil -m cp ~{resfinder_pheno_table_species} ~{outdirpath}/resfinder/
        gsutil -m cp ~{resfinder_seqs} ~{outdirpath}/resfinder/
        gsutil -m cp ~{resfinder_results} ~{outdirpath}/resfinder/
        gsutil -m cp ~{resfinder_pointfinder_pheno_table} ~{outdirpath}/resfinder/
        gsutil -m cp ~{resfinder_pointfinder_results} ~{outdirpath}/resfinder/
        gsutil -m cp ~{ts_mlst_results} ~{outdirpath}/mlst/
        gsutil -m cp ~{prokka_gff} ~{outdirpath}/prokka/
        gsutil -m cp ~{prokka_gbk} ~{outdirpath}/prokka/
        gsutil -m cp ~{prokka_sqn} ~{outdirpath}/prokka/
        gsutil -m cp ~{plasmidfinder_results} ~{outdirpath}/plasmidfinder/
        gsutil -m cp ~{plasmidfinder_seqs} ~{outdirpath}/plasmidfinder/
        gsutil -m cp ~{kleborate_output_file} ~{outdirpath}/kleborate/
        gsutil -m cp ~{legsta_results} ~{outdirpath}/legsta/
        gsutil -m cp ~{pbptyper_pbptype_predicted_tsv} ~{outdirpath}/merlin_magic/
        gsutil -m cp ~{poppunk_gps_external_cluster_csv} ~{outdirpath}/merlin_magic/
        gsutil -m cp ~{seroba_details} ~{outdirpath}/merlin_magic/
        gsutil -m cp ~{midas_report} ~{outdirpath}/midas/
        gsutil -m cp ~{kraken2_classified_read1} ~{outdirpath}/kraken2/
        gsutil -m cp ~{kraken2_classified_read2} ~{outdirpath}/kraken2/
        gsutil -m cp ~{kraken2_classified_report} ~{outdirpath}/kraken2/
        gsutil -m cp ~{kraken2_report} ~{outdirpath}/kraken2/
        gsutil -m cp ~{kraken2_unclassified_read1} ~{outdirpath}/kraken2/
        gsutil -m cp ~{kraken2_unclassified_read2} ~{outdirpath}/kraken2/

        transferdate=`date`
        echo $transferdate | tee TRANSFERDATE
    >>>

    output {
        String transfer_date = read_string("TRANSFERDATE")
    }

    runtime {
        docker: "theiagen/utility:1.0"
        cpu: 2
        disks: "local-disk " + disk_size + " SSD"
        disk: disk_size + " GB"
    }   
}
