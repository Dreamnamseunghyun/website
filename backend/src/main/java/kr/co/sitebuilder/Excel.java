package kr.co.sitebuilder;

import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
public class Excel<T extends Excel.Column> {

    @SuppressWarnings("unused")
    public List<T> getData(File file, Class<T> tClass) {
        Workbook workbook = null;

        try {
            workbook = WorkbookFactory.create(file);
        } catch (IOException e) {
            log.debug("[Excel] " + e.getMessage());
        }

        List<T> list = getData(workbook, tClass);

        try {
            if (workbook != null) {
                workbook.close();
            }
        } catch (IOException e) {
            log.debug("[Excel] " + e.getMessage());
        }

        return list;
    }

    @SuppressWarnings("unused")
    public List<T> getData(MultipartFile file, Class<T> tClass) {
        InputStream inputStream = null;
        Workbook workbook = null;

        try {
            inputStream = file.getInputStream();
            workbook = WorkbookFactory.create(inputStream);
        } catch (IOException e) {
            log.debug("[Excel] " + e.getMessage());
        }

        List<T> list = getData(workbook, tClass);

        try {
            if (workbook != null) {
                workbook.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (IOException e) {
            log.debug("[Excel] " + e.getMessage());
        }

        return list;
    }

    public List<T> getData(Workbook workbook, Class<T> tClass) {
        List<T> list = new ArrayList<>();
        if (workbook == null) {
            return list;
        }

        FormulaEvaluator formulaEvaluator = workbook.getCreationHelper().createFormulaEvaluator();

        Sheet sheet = workbook.getSheetAt(0);

        for (int i = 0; i < sheet.getLastRowNum() + 1; i++) {
            Row row = sheet.getRow(i);
            if ((row == null) || (i == 0)) {
                continue;
            }

            try {
                T vo = tClass.newInstance();

                Field[] fields = vo.getClass().getDeclaredFields();

                String key;

                for (Field field : fields) {
                    key = field.getName();

                    if (!field.isAccessible()) {
                        field.setAccessible(true);
                    }

                    int columnIndex = vo.getColumnIndex(key);
                    if (columnIndex < 0) {
                        continue;
                    }

                    Cell cell = row.getCell(columnIndex);
                    if (cell != null) {
                        cell = formulaEvaluator.evaluateInCell(cell);

                        if (field.getType() == Integer.TYPE) {
                            Integer temp = getInt(cell);
                            field.setInt(vo, temp == null ? 0 : temp);
                        } else if (field.getType() == Integer.class) {
                            field.set(vo, getInt(cell));
                        } else if (field.getType() == Long.TYPE) {
                            Long temp = getLong(cell);
                            field.setLong(vo, temp == null ? 0 : temp);
                        } else if (field.getType() == Long.class) {
                            field.set(vo, getLong(cell));
                        } else if (field.getType() == Float.TYPE) {
                            Float temp = getFloat(cell);
                            field.setFloat(vo, temp == null ? 0 : temp);
                        } else if (field.getType() == Float.class) {
                            field.set(vo, getFloat(cell));
                        } else if (field.getType() == Double.TYPE) {
                            Double temp = getDouble(cell);
                            field.setDouble(vo, temp == null ? 0 : temp);
                        } else if (field.getType() == Double.class) {
                            field.set(vo, getDouble(cell));
                        } else if (field.getType() == Boolean.TYPE) {
                            Boolean temp = getBoolean(cell);
                            field.setBoolean(vo, temp != null && temp);
                        } else if (field.getType() == Boolean.class) {
                            field.set(vo, getBoolean(cell));
                        } else if (field.getType() == String.class) {
                            field.set(vo, getString(cell));
                        } else if (field.getType() == Date.class) {
                            field.set(vo, getDate(cell));
                        }
                    }
                }

                list.add(vo);
            } catch (IllegalAccessException | InstantiationException e) {
                log.debug("[Excel] " + e.getMessage());
            }
        }

        return list;
    }


    private static Integer getInt(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return (int) cell.getNumericCellValue();
        } else if (cell.getCellType() == CellType.STRING) {
            try {
                return Integer.parseInt(cell.getStringCellValue());
            } catch (NumberFormatException e) {
                log.debug("[Excel] " + e.getMessage());
            }
        }

        return null;
    }

    private static Long getLong(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return (long) cell.getNumericCellValue();
        } else if (cell.getCellType() == CellType.STRING) {
            try {
                return Long.parseLong(cell.getStringCellValue());
            } catch (NumberFormatException e) {
                log.debug("[Excel] " + e.getMessage());
            }
        }

        return null;
    }

    private static Float getFloat(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return (float) cell.getNumericCellValue();
        } else if (cell.getCellType() == CellType.STRING) {
            try {
                return Float.parseFloat(cell.getStringCellValue());
            } catch (NumberFormatException e) {
                log.debug("[Excel] " + e.getMessage());
            }
        }

        return null;
    }

    private static Double getDouble(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return cell.getNumericCellValue();
        } else if (cell.getCellType() == CellType.STRING) {
            try {
                return Double.parseDouble(cell.getStringCellValue());
            } catch (NumberFormatException e) {
                log.debug("[Excel] " + e.getMessage());
            }
        }

        return null;
    }

    private static Boolean getBoolean(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return cell.getNumericCellValue() != 0;
        } else if (cell.getCellType() == CellType.STRING) {
            return !StringUtils.isEmpty(cell.getStringCellValue()) &&
                    !cell.getStringCellValue().equalsIgnoreCase("null") &&
                    !cell.getStringCellValue().equalsIgnoreCase("false") &&
                    !cell.getStringCellValue().equals("0");
        } else if (cell.getCellType() == CellType.BOOLEAN) {
            return cell.getBooleanCellValue();
        } else {
            return null;
        }
    }

    private static String getString(Cell cell) {
        if (cell.getCellType() == CellType.NUMERIC) {
            return String.valueOf(cell.getNumericCellValue());
        } else if (cell.getCellType() == CellType.STRING) {
            return cell.getStringCellValue();
        } else {
            return null;
        }
    }

    private static Date getDate(Cell cell) {
        if (DateUtil.isCellDateFormatted(cell)) {
            return cell.getDateCellValue();
        }

        return null;
    }


    public interface Column {

        int getColumnIndex(String name);
    }
}
