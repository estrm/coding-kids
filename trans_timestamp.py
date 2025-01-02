import os
import datetime

def sot_turn_type(turn_datetime_type=False,turn_timestamp_type=False):
    if turn_datetime_type:
        for root,dirs,files in os.walk(path):
            for file in files:
                if '.sot' in file:
                    save_name = datetime.datetime.fromtimestamp(int(file[0:10]))
                    save_name = str(save_name).replace(':','.')
                    os.rename(root+'\\'+file,root+'\\' + save_name + '.sot')
                    print("rename " + file + " to " + save_name + ".sot")
            print('Done')

    if turn_timestamp_type:
         for root,dirs,files in os.walk(path):
            for file in files:
                if '.sot'in file:
                    save_name = datetime.datetime.strptime(file[:-4],'%Y-%m-%d %H.%M.%S').timestamp()
                    save_name = str(int(save_name))
                    os.rename(root+'\\'+file,root+'\\' + save_name + '.sot')
                    print("rename " + file + " to " + save_name + ".sot")
            print('Done')

path = r'F:\sot'
sot_turn_type(turn_datetime_type=True)
