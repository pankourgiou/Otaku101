#x = "import csv import logging import os import subprocess import pygsheets from criteo_tables import lib_path, global_configuration"
#x1 = "sql_path_file = /home/etl/foodpanda/python_scripts_fo/criteo/criteo_data.sql csv_path_file = '/opt/output/python_scripts_fo/criteo/criteo_gdoc_data.csv'"
#x2 = "logger = logging.getLogger('criteo_data_gdoc_loader') logger.setLevel(logging.INFO) handler = logging.StreamHandler() handler.setLevel(logging.INFO) formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s') handler.setFormatter(formatter) logger.addHandler(handler) logger.propagate = False"
#x3 = "def run_psql_command(script): command = 'psql -h {host} -p {db_port} -U {db_user} -d {database} -f {file}.format(host=global_configuration.DwhPsql.db_host, db_port=global_configuration.DwhPsql.db_port,db_user=global_configuration.DwhPsql.db_user, database=global_configuration.DwhPsql.db_name, file=script) subprocess.call(command, shell=True)"
#x4 = "def populate_csv_file(script): Get the Criteo campaign data from the DWH and save it to a CSV file logger.info('Started populating the CSV file from the tables in the DWH') run_psql_command(script) logger.info('Finished populating the CSV file')"
#x5 = "def load_csv_to_gdoc(file_name, gdoc):Create a list of lists with the contents of the CSV file and load them to the Google spreadsheet"
#x6 = "logger.info(Started loading the Criteo campaign data to the Google Spreadsheet) rows = [] with open(file_name, 'rb') as csv_file:"
#x7 = "reader = csv.reader(csv_file) for row in reader: rows.append(map(lambda v: v.decode('utf-8'), row)) client =" 
#x8  = "pygsheets.authorize(service_file='{path}/service_credentials.json'.format(path=lib_path), no_cache=True) worksheet =" 
#x9 = "client.open_by_key(gdoc['key']).worksheet_by_title(gdoc['sheet_name']) worksheet.resize(len(rows), 18) worksheet.clear()" 
#x10 = "worksheet.update_cells(crange='A1:R{}'.format(len(rows)), values=rows) logger.info('Finished loading the Criteo campaign data to the Google Spreadsheet') os.remove(file_name) if __name__ == '__main__': populate_csv_file(sql_path_file) load_csv_to_gdoc(csv_path_file, global_configuration.Criteo.gdoc)"
    
#print(bool(x))
#print(bool(x1))
#print(bool(x2))
#print(bool(x3))
#print(bool(x4))
#print(bool(x5))
#print(bool(x6))
#print(bool(x7))
#print(bool(x8))
#print(bool(x9))
#print(bool(x10))
